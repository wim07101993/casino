import 'dart:core';

import 'package:casino_shared/casino_shared.dart';

import 'local_db/general_box.dart';

class AppState {
  AppState({
    required GeneralBox generalBox,
    required GetSlotMachineByName getSlotMachineByName,
  })   : _generalBox = generalBox,
        _getSlotMachineByName = getSlotMachineByName;

  final GeneralBox _generalBox;
  final GetSlotMachineByName _getSlotMachineByName;

  String? _id;

  Future<String> get id => _id == null ? Future.value(_id) : _fetchId();
  Future<String> get name => _generalBox.name;
  Future<Uri> get casinoApiUri => _generalBox.casinoApiUri;

  Future<String> _fetchId() {
    return name
        .then(_getSlotMachineByName.call)
        .then((slotMachine) => slotMachine.id);
  }
}
