import 'package:casino_shared/casino_shared.dart';

import 'id.dart';

class TokenCount {
  TokenCount({
    required GetTokenCount getTokenCount,
    required SetTokenCount setTokenCount,
    required Id id,
    required SlotMachineChanges slotMachineChanges,
  })   : _getTokenCount = getTokenCount,
        _setTokenCount = setTokenCount,
        _id = id,
        _slotMachineChanges = slotMachineChanges;

  final Id _id;
  final GetTokenCount _getTokenCount;
  final SetTokenCount _setTokenCount;
  final SlotMachineChanges _slotMachineChanges;

  int? value;

  Future<int> call() {
    if (value == null) {
      return _id().then((id) {
        _slotMachineChanges.of(id).forEach((e) => value = e.tokens);
        return _getTokenCount(id);
      });
    } else {
      return Future.value(value);
    }
  }

  Future<void> set(int value) => _id().then((id) => _setTokenCount(id, value));

  Stream<int> changes() async* {
    final id = await _id();
    yield* _slotMachineChanges.of(id).map((e) => e.tokens);
  }
}
