import 'package:casino_shared/casino_shared.dart';

import 'global_listenable_property.dart';
import 'id.dart';

class TokenCount implements GlobalListenableProperty<int> {
  TokenCount({
    required CasinoApi api,
    required Id id,
    required SlotMachineChanges slotMachineChanges,
  })  : _api = api,
        _id = id,
        _slotMachineChanges = slotMachineChanges;

  final Id _id;
  final CasinoApi _api;
  final SlotMachineChanges _slotMachineChanges;

  int? value;

  @override
  Future<int> call() {
    if (value == null) {
      return _id().then((id) {
        _slotMachineChanges.of(id).forEach((e) => value = e.tokens);
        return _api.getTokens(id);
      });
    } else {
      return Future.value(value);
    }
  }

  @override
  Future<void> set(int value) => _id().then((id) => _api.setTokens(id, value));

  @override
  Stream<int> get changes async* {
    final id = await _id();
    yield* _slotMachineChanges.of(id).map((e) => e.tokens);
  }
}
