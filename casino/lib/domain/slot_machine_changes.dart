import 'dart:convert';

import 'package:casino_shared/casino_shared.dart' as shared;

import '../models/models.dart';

class SlotMachineChanges {
  const SlotMachineChanges({
    required this.changes,
    required this.converter,
  });

  final shared.SlotMachineChanges changes;
  final Converter<shared.SlotMachine, SlotMachine> converter;

  Stream<Iterable<SlotMachine>> call() {
    return changes.stream.map((list) => list.map(converter.convert));
  }
}
