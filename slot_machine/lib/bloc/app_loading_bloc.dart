import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:casino_shared/casino_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import '../data/local_db/general_box.dart';
import '../domain/casino_api_uri.dart';
import '../domain/id.dart';
import '../domain/name.dart';
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
  const factory AppLoadingState.initial() = _Initial;
  const factory AppLoadingState.registeringCore() = _RegisteringCore;
  const factory AppLoadingState.loadingHive() = _LoadingHive;
  const factory AppLoadingState.initializingDI() = _InitializingDI;
  const factory AppLoadingState.gettingId() = _GettingId;
  const factory AppLoadingState.gettingTokenCount() = _GettingTokenCount;
  const factory AppLoadingState.loaded() = _Loaded;
  const factory AppLoadingState.error(Object error) = _Error;
}

class AppLoadingBloc extends Bloc<AppLoadingEvent, AppLoadingState> {
  AppLoadingBloc() : super(const AppLoadingState.initial());

  @override
  Stream<AppLoadingState> mapEventToState(AppLoadingEvent event) {
    return event.when(
      load: _load,
    );
  }

  Stream<AppLoadingState> _load() async* {
    yield const AppLoadingState.registeringCore();
    di.registerCasinoShared();
    final logger = di<Logger>();

    try {
      yield const AppLoadingState.loadingHive();
      await di.registerDb();
      log('initialized hive');

      yield const AppLoadingState.initializingDI();
      await di.registerDomain();
      await di.registerBloc();
      log('initialized di');

      yield const AppLoadingState.gettingId();
      final id = await di<Id>()();
      log('received id: $id');
      final name = await di<Name>()();
      log('name: $name');

      yield const AppLoadingState.gettingTokenCount();
      final tokenCount = await di<TokenCount>()();
      log('received tokens: $tokenCount');

      yield const AppLoadingState.loaded();
    } catch (e, stacktrace) {
      logger.e('error while loading app', e, stacktrace);
      yield AppLoadingState.error(e);
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
        id: call(),
        logger: call(),
      ),
    );
  }
}
