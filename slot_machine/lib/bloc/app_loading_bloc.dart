import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import '../data/local_db/general_box.dart';
import '../domain/casino_api_uri.dart';
import '../domain/id.dart';
import '../domain/is_dark_mode_enabled.dart';
import '../domain/name.dart';
import '../domain/primary_color.dart';
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
    @Default(Colors.blue) Color color,
    @Default(false) bool isDarkModeEnabled,
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

      final isDarkModeEnabled = di<IsDarkModeEnabled>();
      await isDarkModeEnabled()
          .then((e) => emit(state.copyWith(isDarkModeEnabled: e)));
      isDarkModeEnabled.changes
          .forEach((e) => emit(state.copyWith(isDarkModeEnabled: e)));

      final primaryColor = di<PrimaryColor>();
      await primaryColor().then((e) => emit(state.copyWith(color: e)));
      primaryColor.changes.forEach((e) => emit(state.copyWith(color: e)));

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
  Future<void> registerDb() async {
    Hive.init(Directory.current.path);
    di.registerSingleton<HiveInterface>(Hive);
    di.registerLazySingleton(() => GeneralBox(hive: di(), nameGenerator: di()));
    final generalBox = di<GeneralBox>();
    await generalBox.init();
  }

  Future<void> registerDomain() async {
    registerLazySingleton(() => PrimaryColor(generalBox: call()));
    registerLazySingleton(() => IsDarkModeEnabled(generalBox: call()));
    registerLazySingleton(
      () => Name(
        setName: call(),
        generalBox: call(),
        slotMachineChanges: call(),
        id: call(),
      ),
    );
    registerLazySingleton(
      () => Id(
        getSlotMachineByName: call(),
        addSlotMachine: call(),
        generalBox: call(),
      ),
    );
    registerLazySingleton(() => CasinoApiUri(generalBox: call()));
    registerLazySingleton(
      () => TokenCount(
        getTokenCount: call(),
        setTokenCount: call(),
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
      ),
    );
    registerFactory(
      () => SettingsBloc(
        casinoApiUri: call(),
        name: call(),
        logger: call(),
        primaryColor: call(),
        isDarkModeEnabled: call(),
      ),
    );
  }
}
