import 'dart:convert';

import 'package:casino_shared/casino_shared.dart' as shared;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'app.dart';
import 'app_settings.dart';
import 'bloc/slot_machine_list_bloc.dart';
import 'domain/add_slot_machine.dart';
import 'domain/get_token_count.dart';
import 'domain/list_slot_machines.dart';
import 'domain/remove_slot_machine.dart';
import 'domain/set_token_count.dart';
import 'domain/slot_machine_changes.dart';
import 'domain/slot_machine_converter.dart';
import 'models/models.dart';

final di = GetIt.instance;

void main() {
  di.registerApp();
  runApp(const App());
}

extension GetItExtensions on GetIt {
  void registerApp() {
    registerLazySingleton(() {
      return const AppSettings(
        apiUrl: 'https://casino-310408.ew.r.appspot.com',
      );
    });
    registerLazySingleton(() => Client());
    registerLazySingleton(() => Logger());
    registerLazySingleton(() => AddSlotMachine(api: call()));
    registerLazySingleton(() => RemoveSlotMachine(api: call()));
    registerLazySingleton(
      () => ListSlotMachines(api: call(), converter: call()),
    );
    registerLazySingleton(() => SetTokenCount(api: call()));
    registerLazySingleton(() => GetTokenCount(api: call()));
    registerLazySingleton<Converter<SlotMachine, shared.SlotMachine>>(
      () => SlotMachineToSharedConverter(),
    );
    registerLazySingleton<Converter<shared.SlotMachine, SlotMachine>>(
      () => SharedToSlotMachineConverter(),
    );
    registerLazySingleton(
      () => SlotMachineChanges(changes: call(), converter: call()),
    );
    registerLazySingleton(
      () => shared.CasinoApi(
        http: call(),
        config: call(),
        logger: call(),
      ),
    );
    registerLazySingleton(() => shared.SlotMachineChanges(casinoApi: call()));

    registerFactory(
      () => SlotMachineListBloc(
        logger: call(),
        addSlotMachine: call(),
        removeSlotMachine: call(),
        slotMachinesChanges: call(),
      ),
    );
    registerFactory<shared.CasinoApiSettings>(() => call<AppSettings>());
  }
}
