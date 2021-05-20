import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart' hide BoxEvent;

class BoxEntry<T> {
  BoxEntry({
    required this.key,
    required this.box,
    required this.defaultValue,
    int saveDelay = 0,
  })  : _valueToSave = defaultValue,
        _saveDelay = saveDelay;

  final String key;
  @protected
  final Future<Box> box;
  @protected
  final T defaultValue;
  final int _saveDelay;

  int _timeUntilSave = 0;
  T _valueToSave;
  bool _isWaitingToSave = false;
  Future<void> _savingFuture = Future.value();

  Future<T> call() async {
    final value = await box.then((b) => b.get(key));
    if (value == null) {
      set(defaultValue);
      return defaultValue;
    }
    return value as T;
  }

  Future<void> set(T value) {
    if (_saveDelay == 0) {
      return _save(value);
    }
    _timeUntilSave = _saveDelay;
    if (!_isWaitingToSave) {
      _isWaitingToSave = true;
      _savingFuture = _startSetValue();
    }
    _valueToSave = value;
    return _savingFuture;
  }

  Future<void> _startSetValue() async {
    final interval = (_saveDelay / 100).round();
    while (_timeUntilSave > 0) {
      await Future.delayed(Duration(milliseconds: interval));
      _timeUntilSave -= interval;
    }
    _isWaitingToSave = false;
    return _save(_valueToSave);
  }

  Future<void> _save(T value) async {
    return box.then((b) => b.put(key, value));
  }

  Stream<T> get changes async* {
    final box = await this.box;
    yield* box.watch(key: key).map((e) => e.value as T);
  }
}
