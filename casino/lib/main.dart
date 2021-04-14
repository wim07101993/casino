import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'app.dart';
import 'data/app_settings.dart';
import 'data/casino_api.dart';

final di = GetIt.instance;

void main() {
  di.registerApp();
  runApp(const App());
}

extension GetItExtensions on GetIt {
  void registerApp() {
    registerLazySingleton(() {
      return const AppSettings(
        apiUrl: 'https://casino-310408.ew.r.appspot.com/',
      );
    });
    registerLazySingleton(() => Client());
    registerLazySingleton(() => Logger());
    registerLazySingleton(() => CasinoApi(http: call(), config: call()));
  }
}
