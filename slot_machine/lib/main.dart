import 'dart:io';

import 'package:casino_shared/casino_shared.dart' hide SlotMachine;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart' hide BoxEvent;

import 'bloc/game_bloc.dart';
import 'bloc/settings_bloc.dart';
import 'local_db/general_box.dart';
import 'slot_machine.dart';

final GetIt di = GetIt.instance;

Future<void> main() async {
  // always call this method if the main method is async
  WidgetsFlutterBinding.ensureInitialized();

  await di.registerApp();
  // await di<GeneralBox>().drop();

  runApp(const SlotMachine());
}

extension GetItExtensions on GetIt {
  Future<void> registerApp() async {
    registerCasinoShared();
    registerLazySingleton(
      () => GameBloc(
        logger: call(),
        setTokenCount: call(),
        addSlotMachine: call(),
        generalBox: call(),
        getSlotMachineByName: call(),
        slotMachineChanges: call(),
        random: call(),
      ),
    );
    registerFactory(() => SettingsBloc(generalBox: call(), logger: call()));
    Hive.init(Directory.current.path);
    registerLazySingleton<HiveInterface>(() => Hive);
    registerLazySingleton(
      () => GeneralBox(hive: call(), nameGenerator: call()),
    );
    di.registerSingleton(
      CasinoApiSettings(url: await call<GeneralBox>().casinoApiUri),
    );
  }
}
