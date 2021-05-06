import 'dart:convert';

import '../casino_api/casino_api.dart';
import '../models/models.dart';

class ListSlotMachines {
  const ListSlotMachines({
    required this.api,
    required this.converter,
  });

  final CasinoApi api;
  final Converter<SlotMachineDTO, SlotMachine> converter;

  Future<List<SlotMachine>> call() async {
    final dtos = await api
        .listSlotMachines()
        .then((x) => x..sort((a, b) => a.name.compareTo(b.name)));
    return dtos.map(converter.convert).toList();
  }
}
