import 'dart:developer';
import 'dart:math' show Random;

import 'package:bloc/bloc.dart';
import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/app_theme.dart';
import '../domain/casino_api_uri.dart';
import '../domain/id.dart';
import '../domain/is_dark_mode_enabled.dart';
import '../domain/is_mouse_enabled.dart';
import '../domain/local_db/app_settings_box.dart';
import '../domain/local_db/theme_box.dart';
import '../domain/name.dart';
import '../domain/primary_color.dart';
import '../domain/secondary_color.dart';
import '../domain/selected_theme_type.dart';
import '../domain/themes/app_theme_data.dart';
import '../domain/token_count.dart';
import '../main.dart';
import 'game_bloc.dart';
import 'settings_bloc.dart';

part 'app_loading_bloc.freezed.dart';

@freezed
class AppLoadingEvent with _$AppLoadingEvent {
  const factory AppLoadingEvent.load() = _AppLoadingEvent;
}

@freezed
class AppLoadingState with _$AppLoadingState {
  const factory AppLoadingState({
    @Default(LoadingStage.notLoaded()) LoadingStage loadingStage,
    AppThemeData? appTheme,
    Object? error,
  }) = _AppLoadingState;
}

@freezed
class LoadingStage with _$LoadingStage {
  const factory LoadingStage.notLoaded() = _NotLoaded;
  const factory LoadingStage.registeringCore() = _RegisteringCore;
  const factory LoadingStage.loadingHive() = _LoadingHive;
  const factory LoadingStage.initializingDI() = _InitializingDI;
  const factory LoadingStage.gettingId() = _GettingId;
  const factory LoadingStage.gettingTokenCount() = _GettingTokenCount;
  const factory LoadingStage.loaded() = _Loaded;
}

class AppLoadingBloc extends Bloc<AppLoadingEvent, AppLoadingState> {
  AppLoadingBloc() : super(const AppLoadingState());

  @override
  Stream<AppLoadingState> mapEventToState(AppLoadingEvent event) {
    return event.when(
      load: _load,
    );
  }

  Stream<AppLoadingState> _load() async* {
    yield state.copyWith(loadingStage: const _RegisteringCore(), error: null);
    di.registerCasinoShared();
    final logger = di<Logger>();

    try {
      yield state.copyWith(loadingStage: const _LoadingHive());
      await di.registerDb();
      log('initialized hive');

      yield state.copyWith(loadingStage: const _InitializingDI());
      await di.registerDomain();
      await di.registerBloc();
      log('initialized di');

      final appTheme = di<AppTheme>();
      yield state.copyWith(appTheme: await appTheme());
      appTheme.changes.forEach((e) => emit(state.copyWith(appTheme: e)));

      yield state.copyWith(loadingStage: const _GettingId());
      final id = await di<Id>()();
      log('received id: $id');
      final name = await di<Name>()();
      log('name: $name');

      yield state.copyWith(loadingStage: const _GettingTokenCount());
      final tokenCount = await di<TokenCount>()();
      log('received tokens: $tokenCount');

      yield state.copyWith(loadingStage: const _Loaded());
    } catch (e, stacktrace) {
      logger.e('error while loading app', e, stacktrace);
      yield state.copyWith(error: e);
    }
  }
}

extension _GetItExtensions on GetIt {
  void registerCasinoShared() {
    di.registerLazySingleton(() => Client());
    di.registerLazySingleton(
      () => CasinoApi(http: di(), config: di(), logger: di()),
    );
    di.registerLazySingleton(
      () => Logger(printer: PrettyPrinter(methodCount: 6)),
    );
    di.registerLazySingleton(() => NameGenerator(random: di()));
    di.registerLazySingleton(() => Random());
    di.registerLazySingleton(
      () => SlotMachineChanges(casinoApi: di(), interval: 5000),
    );
  }

  Future<void> registerDb() async {
    final path = await getApplicationDocumentsDirectory().then((e) => e.path);
    log(path);
    Hive.init(path);
    di.registerSingleton<HiveInterface>(Hive);
    di.registerLazySingleton(
      () => AppSettingsBox(hive: di(), nameGenerator: di()),
    );
    di.registerLazySingleton(() => ThemeBox(hive: di()));
  }

  Future<void> registerDomain() async {
    registerLazySingleton(() => AppTheme(db: call()));
    registerLazySingleton(() => CasinoApiUri(db: call()));
    registerLazySingleton(() => Id(api: call(), db: call()));
    registerLazySingleton(() => IsDarkModeEnabled(db: call()));
    registerLazySingleton(() => IsMouseEnabled(db: call()));
    registerLazySingleton(
      () => Name(
        api: call(),
        db: call(),
        slotMachineChanges: call(),
        id: call(),
      ),
    );
    registerLazySingleton(() => PrimaryColor(db: call()));
    registerLazySingleton(() => SecondaryColor(db: call()));
    registerLazySingleton(() => SelectedThemeType(db: call()));
    registerLazySingleton(
      () => TokenCount(
        api: call(),
        id: call(),
        slotMachineChanges: call(),
      ),
    );

    final uri = await call<CasinoApiUri>()();
    registerSingleton(CasinoApiSettings(url: uri));
  }

  Future<void> registerBloc() async {
    registerLazySingleton(
      () => GameBloc(
        logger: call(),
        random: call(),
        tokenCount: call(),
        theme: call(),
      ),
    );
    registerFactory(
      () => SettingsBloc(
        casinoApiUri: call(),
        name: call(),
        logger: call(),
        primaryColor: call(),
        secondaryColor: call(),
        isDarkModeEnabled: call(),
        selectedThemeType: call(),
      ),
    );
  }
}
