library casino_shared;

import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'src/casino_api/casino_api.dart';
import 'src/casino_api/slot_machine_changes.dart';
import 'src/name_generator/name_generator.dart';

export 'package:logger/logger.dart';

export 'src/bloc_wrapper.dart';
export 'src/casino_api/casino_api.dart'
    show CasinoApiSettings, CasinoApiException, SlotMachine, CasinoApi;
export 'src/casino_api/slot_machine_changes.dart';
export 'src/functions.dart';
export 'src/name_generator/name_generator.dart';
export 'src/uri_extensions.dart';

extension CasinoSharedGetItExtensions on GetIt {
  void registerCasinoShared() {
    registerLazySingleton(() => Client());
    registerLazySingleton(
      () => CasinoApi(http: call(), config: call(), logger: call()),
    );
    registerLazySingleton(() => Logger(printer: PrettyPrinter(methodCount: 6)));
    registerLazySingleton(() => NameGenerator(random: call()));
    registerLazySingleton(() => Random());
    registerLazySingleton(() => SlotMachineChanges(casinoApi: call()));
  }
}
