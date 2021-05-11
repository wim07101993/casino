import 'package:casino_shared/casino_shared.dart';

import '../data/local_db/general_box.dart';

class Id {
  Id({
    required GetSlotMachineByName getSlotMachineByName,
    required AddSlotMachine addSlotMachine,
    required GeneralBox generalBox,
  })   : _getSlotMachineByName = getSlotMachineByName,
        _generalBox = generalBox,
        _addSlotMachine = addSlotMachine;

  String? _id;

  final GeneralBox _generalBox;
  final GetSlotMachineByName _getSlotMachineByName;
  final AddSlotMachine _addSlotMachine;

  Future<String> call() => _id != null ? Future.value(_id) : _fetchId();

  Future<String> _fetchId() async {
    final name = await _generalBox.name();
    try {
      final slotMachine = await _getSlotMachineByName(name);
      return _id = slotMachine.id;
    } on CasinoApiException catch (e) {
      final isNotFound = e.maybeWhen(
        orElse: () => false,
        notFound: (_) => true,
      );
      if (isNotFound) {
        return _addSlotMachine(name);
      }
      rethrow;
    }
  }
}
