import 'package:casino_shared/casino_shared.dart';

import '../data/local_db/general_box.dart';
import 'id.dart';

class Name {
  Name({
    required Id id,
    required SetName setName,
    required SlotMachineChanges slotMachineChanges,
    required GeneralBox generalBox,
  })   : _setName = setName,
        _generalBox = generalBox,
        _id = id,
        _slotMachineChanges = slotMachineChanges {
    id().then(
      (id) => _slotMachineChanges
          .of(id)
          .forEach((e) => generalBox.name.set(e.name)),
    );
  }

  final Id _id;
  final GeneralBox _generalBox;
  final SetName _setName;
  final SlotMachineChanges _slotMachineChanges;

  Future<String> call() async => _generalBox.name();

  Future<void> set(String value) => _id().then((id) => _setName(id, value));

  Stream<String> changes() async* {
    yield* _slotMachineChanges.of(await _id()).map((e) => e.name);
  }
}
