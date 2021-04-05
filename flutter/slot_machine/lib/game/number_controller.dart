import 'dart:math';

import 'package:flutter/foundation.dart';

class NumberController extends ValueListenable<int> {
  /// Creates a new controller which controls a [Number].
  ///
  /// [minValue] is the minimum generated value.
  ///
  /// [maxValue] is the maximum generated value.
  ///
  /// [minRollDuration] is the minimum duration the number should roll.
  ///
  /// [maxRollDuration] is the maximum duration the number should roll.
  ///
  /// [rollSpeed] is the speed at which the number should change in numbers per
  /// millisecond.
  NumberController({
    required this.random,
    this.minValue = 0,
    this.maxValue = 7,
    this.minRollDuration = const Duration(seconds: 1),
    this.maxRollDuration = const Duration(seconds: 5),
    this.rollSpeed = 1,
  }) : _listeners = [];

  final Random random;
  final int minValue;
  final int maxValue;
  final Duration minRollDuration;
  final Duration maxRollDuration;
  final List<void Function()> _listeners;
  final double rollSpeed;

  int _value = 0;

  @override
  int get value => _value;

  Future<int> roll() async {
    final start = DateTime.now();
    final rollDuration = _getRandomRollDuration();
    final interval = (1 / rollSpeed).round();
    while (true) {
      _value = random.nextInt(maxValue - minValue) + minValue;
      _notifyListeners();
      if (DateTime.now().difference(start).inMicroseconds > rollDuration) {
        return value;
      }
      await Future.delayed(Duration(milliseconds: interval));
    }
  }

  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  int _getRandomRollDuration() {
    final randomValue = random.nextInt(
      maxRollDuration.inMicroseconds - minRollDuration.inMicroseconds,
    );
    return randomValue + minRollDuration.inMicroseconds;
  }

  @override
  void addListener(void Function() listener) => _listeners.add(listener);

  @override
  void removeListener(void Function() listener) => _listeners.remove(listener);
}
