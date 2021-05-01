import 'dart:convert';

import 'package:casino_shared/casino_shared.dart' as shared;

import '../models/models.dart';

class SharedToSlotMachineConverter
    extends Converter<shared.SlotMachine, SlotMachine> {
  @override
  SlotMachine convert(shared.SlotMachine input) {
    return SlotMachine(
      id: input.id,
      name: input.name,
      tokens: input.tokens,
    );
  }
}

class SlotMachineToSharedConverter
    extends Converter<SlotMachine, shared.SlotMachine> {
  @override
  shared.SlotMachine convert(SlotMachine input) {
    return shared.SlotMachine.create(
      id: input.id,
      name: input.name,
      tokens: input.tokens,
    );
  }
}
