import 'dart:convert';

import '../casino_api/casino_api.dart';
import '../models/models.dart';

class DTOToSlotMachineConverter extends Converter<SlotMachineDTO, SlotMachine> {
  const DTOToSlotMachineConverter();

  @override
  SlotMachine convert(SlotMachineDTO input) {
    return SlotMachine(
      id: input.id,
      name: input.name,
      tokens: input.tokens,
    );
  }
}
