import 'dart:async';

import 'package:uuid/uuid.dart';

import '../casino_shared.dart';

const _uuid = Uuid();

class SlotMachineChanges {
  SlotMachineChanges({required this.casinoApi}) {
    _listenToApi();
  }

  final CasinoApi casinoApi;
  final StreamController<List<SlotMachine>> _streamController =
      StreamController.broadcast();

  List<SlotMachine>? _slotMachines;

  Stream<List<SlotMachine>> get stream => _streamController.stream;

  Future<void> _listenToApi() async {
    while (true) {
      try {
        final newList = await casinoApi.listSlotMachines();
        if (newList.length != _slotMachines?.length ||
            (_slotMachines != null &&
                !newList.every((e) => _slotMachines!.contains(e)))) {
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
