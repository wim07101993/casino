import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
        addSlotMachine: call(),
        removeSlotMachine: call(),
        slotMachinesChanges: call(),
      ),
    );
    registerFactory<CasinoApiSettings>(
      () => CasinoApiSettings(
        url: Uri.parse('https://casino-310408.ew.r.appspot.com'),
      ),
    );
  }
}
