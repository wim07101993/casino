import 'package:casino_shared/casino_shared.dart';

import 'id.dart';

class TokenCount {
  TokenCount({
    required CasinoApi api,
    required Id id,
    required SlotMachineChanges slotMachineChanges,
  })   : _api = api,
        _id = id,
        _slotMachineChanges = slotMachineChanges;

  final Id _id;
  final CasinoApi _api;
  final SlotMachineChanges _slotMachineChanges;

  int? value;

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

  Future<void> set(int value) => _id().then((id) => _api.setTokens(id, value));

  Stream<int> changes() async* {
    final id = await _id();
    yield* _slotMachineChanges.of(id).map((e) => e.tokens);
  }
}
