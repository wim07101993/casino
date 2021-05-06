import 'dart:convert';

import '../casino_api/casino_api.dart';
import '../models/models.dart';

class GetSlotMachineByName {
  const GetSlotMachineByName({
    required this.api,
    required this.converter,
  });

  final CasinoApi api;
  final Converter<SlotMachineDTO, SlotMachine> converter;

  Future<SlotMachine> call(String name) {
    return api.getSlotMachineByName(name).then((dto) => converter.convert(dto));
  }
}
