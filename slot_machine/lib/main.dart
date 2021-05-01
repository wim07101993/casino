import 'package:casino_shared/casino_shared.dart' hide SlotMachine;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'data/app_settings.dart';
import 'slot_machine.dart';

late GetIt di;

void main() {
  di.registerApp();
  runApp(const SlotMachine());
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
    registerLazySingleton(
      () => CasinoApi(http: call(), config: call(), logger: call()),
    );

    registerFactory<CasinoApiSettings>(() => call<AppSettings>());
  }
}
