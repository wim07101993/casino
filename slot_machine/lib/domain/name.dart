import 'package:casino_shared/casino_shared.dart';

import 'global_listenable_property.dart';
import 'id.dart';
import 'local_db/api_settings_box.dart';

class Name implements GlobalListenableProperty<String> {
  Name({
    required Id id,
    required CasinoApi api,
    required SlotMachineChanges slotMachineChanges,
    required ApiSettingsBox db,
  })  : _api = api,
        _db = db,
        _id = id,
        _slotMachineChanges = slotMachineChanges {
    id().then(
      (id) => _slotMachineChanges.of(id).forEach((e) => db.name.set(e.name)),
    );
  }

  final Id _id;
  final ApiSettingsBox _db;
  final CasinoApi _api;
  final SlotMachineChanges _slotMachineChanges;

  @override
  Future<String> call() async => _db.name();

  @override
  Future<void> set(String value) => _id().then((id) => _api.setName(id, value));

  @override
  Stream<String> get changes async* {
    yield* _slotMachineChanges.of(await _id()).map((e) => e.name);
  }
}
