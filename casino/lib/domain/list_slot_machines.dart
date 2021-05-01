import 'dart:convert';

import 'package:casino_shared/casino_shared.dart' as shared;

import '../models/models.dart';

class ListSlotMachines {
  const ListSlotMachines({
    required this.api,
    required this.converter,
  });

  final shared.CasinoApi api;
  final Converter<shared.SlotMachine, SlotMachine> converter;

  Future<List<SlotMachine>> call() async {
    final dtos = await api
        .listSlotMachines()
        .then((x) => x..sort((a, b) => a.name.compareTo(b.name)));
    return dtos.map(converter.convert).toList();
  }
}
