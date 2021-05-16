import 'dart:async';
import 'dart:convert';

import '../casino_api/casino_api.dart';
import '../models/models.dart';

class SlotMachineChanges {
  SlotMachineChanges({
    required this.casinoApi,
    required this.converter,
  }) {
    _listenToApi();
  }

  final CasinoApi casinoApi;
  final Converter<SlotMachineDTO, SlotMachine> converter;
  final StreamController<List<SlotMachine>> _streamController =
      StreamController.broadcast();

  List<SlotMachine>? _slotMachines;

  Stream<List<SlotMachine>> get stream => _streamController.stream;

  Stream<SlotMachine> of(String id) {
    return _streamController.stream
        .map((list) => list
            .cast<SlotMachine?>()
            .firstWhere((e) => e?.id == id, orElse: () => null))
        .where((e) => e != null)
        .cast<SlotMachine>();
  }

  Future<void> _listenToApi() async {
    // ignore: literal_only_boolean_expressions
    while (true) {
      try {
        final newList = await casinoApi
            .listSlotMachines()
            .then((items) => items.map(converter.convert).toList());

        if (_slotMachines == null ||
            newList.length != _slotMachines!.length ||
            !newList.every((e) => _slotMachines!.contains(e))) {
          _slotMachines = newList;
          _streamController.add(newList);
        }
      } catch (e, stackTrace) {
        _streamController.addError(e, stackTrace);
      }
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }
}
