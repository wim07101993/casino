import 'dart:async';

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
  final StreamController<int> _valueChanges = StreamController.broadcast();

  int? _tokenCount;

  @override
  Future<int> call() async {
    if (_tokenCount != null) {
      return _tokenCount!;
    }
    final id = await _id();
    final tokens = await _api.getTokens(id);
    _slotMachineChanges.of(id).map((e) => e.tokens).forEach((tokens) {
      _tokenCount = tokens;
      _valueChanges.add(tokens);
    });
    _tokenCount = tokens;
    _valueChanges.add(tokens);
    return tokens;
  }

  @override
  Future<void> set(int value) {
    _tokenCount = value;
    _valueChanges.add(value);
    return _id().then((id) => _api.setTokens(id, value));
  }

  @override
  Stream<int> get changes async* {
    await call();
    yield* _valueChanges.stream.map((e) => e);
  }
}
