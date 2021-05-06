library casino_shared;

import 'dart:convert';
import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'src/casino_api/casino_api.dart';
import 'src/domain/add_slot_machine.dart';
import 'src/domain/get_slot_machine_by_name.dart';
import 'src/domain/get_token_count.dart';
import 'src/domain/list_slot_machines.dart';
import 'src/domain/remove_slot_machine.dart';
import 'src/domain/set_name.dart';
import 'src/domain/set_token_count.dart';
import 'src/domain/slot_machine_changes.dart';
import 'src/domain/slot_machine_converter.dart';
import 'src/models/models.dart';
import 'src/name_generator/name_generator.dart';

export 'package:logger/logger.dart';

export 'src/bloc_wrapper.dart';
export 'src/casino_api/casino_api.dart'
    show CasinoApiSettings, CasinoApiException;
export 'src/domain/add_slot_machine.dart';
export 'src/domain/get_slot_machine_by_name.dart';
export 'src/domain/get_token_count.dart';
export 'src/domain/list_slot_machines.dart';
export 'src/domain/remove_slot_machine.dart';
export 'src/domain/set_name.dart';
export 'src/domain/set_token_count.dart';
export 'src/domain/slot_machine_changes.dart';
export 'src/functions.dart';
export 'src/models/models.dart';
export 'src/name_generator/name_generator.dart';
export 'src/uri_extensions.dart';

extension CasinoSharedGetItExtensions on GetIt {
  void registerCasinoShared() {
    registerLazySingleton(() => AddSlotMachine(api: call()));
    registerLazySingleton(
      () => CasinoApi(
        http: call(),
        config: call(),
        logger: call(),
      ),
    );
    registerLazySingleton(() => Client());
    registerLazySingleton(() => GetTokenCount(api: call()));
    registerLazySingleton(
      () => GetSlotMachineByName(api: call(), converter: call()),
    );
    registerLazySingleton(
      () => ListSlotMachines(api: call(), converter: call()),
    );
    registerLazySingleton(() => Logger());
    registerLazySingleton(() => NameGenerator(random: call()));
    registerLazySingleton(() => Random());
    registerLazySingleton(() => RemoveSlotMachine(api: call()));
    registerLazySingleton(() => SetName(api: call()));
    registerLazySingleton(() => SetTokenCount(api: call()));
    registerLazySingleton(
      () => SlotMachineChanges(casinoApi: call(), converter: call()),
    );
    registerLazySingleton<Converter<SlotMachineDTO, SlotMachine>>(
      () => const DTOToSlotMachineConverter(),
    );
  }
}
