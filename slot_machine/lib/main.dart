import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'slot_machine.dart';

late GetIt di;

void main() {
  initDi();
  runApp(const SlotMachine());
}

void initDi() {
  di = GetIt.instance..registerLazySingleton(() => Random());
}
