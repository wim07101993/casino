import 'dart:math';

import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'app.dart';
import 'bloc/slot_machine_list_bloc.dart';

final di = GetIt.instance;

void main() {
  di.registerApp();
  runApp(const App());
}

extension GetItExtensions on GetIt {
  void registerApp() {
    registerCasinoShared();
    registerFactory(
      () => SlotMachineListBloc(
        logger: call(),
        api: call(),
        slotMachinesChanges: call(),
      ),
    );
    registerFactory<CasinoApiSettings>(
      () => CasinoApiSettings(
        url: Uri.parse('https://casino-310408.ew.r.appspot.com'),
      ),
    );
  }

  void registerCasinoShared() {
    di.registerLazySingleton(() => Client());
    di.registerLazySingleton(
      () => CasinoApi(http: di(), config: di(), logger: di()),
    );
    di.registerLazySingleton(
        () => Logger(printer: PrettyPrinter(methodCount: 6)));
    di.registerLazySingleton(() => NameGenerator(random: di()));
    di.registerLazySingleton(() => Random());
    di.registerLazySingleton(
      () => SlotMachineChanges(
        casinoApi: di(),
        interval: 1000,
      ),
    );
  }
}
