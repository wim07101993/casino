import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' as foundation;

class Controller<T> extends foundation.ValueListenable<T> {
  Controller({required T value}) : _value = value;

  final List<VoidCallback> _listeners = [];
  T _value;

  @override
  T get value => _value;
  set value(T value) {
    _value = value;
    invokeListeners();
  }

  @override
  void addListener(VoidCallback listener) => _listeners.add(listener);
  @override
  void removeListener(VoidCallback listener) => _listeners.remove(listener);

  @protected
  void invokeListeners() => _listeners.forEach((l) => l());
}
