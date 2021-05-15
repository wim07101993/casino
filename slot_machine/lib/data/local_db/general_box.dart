import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/painting.dart';
import 'package:hive/hive.dart' hide BoxEvent;

import 'box_event.dart';

class GeneralBox {
  GeneralBox({
    required HiveInterface hive,
    required NameGenerator nameGenerator,
  })   : _nameGenerator = nameGenerator,
        _hive = hive;

  static const String casinoApiUriKey = 'api-url';
  static const String nameKey = 'name';

  final HiveInterface _hive;
  final NameGenerator _nameGenerator;
  late BoxEntry<Uri> _casinoApiUri;
  late BoxEntry<String> _name;
  late BoxEntry<Color> _applicationColor;
  late BoxEntry<bool> _isDarkModeEnabled;

  BoxEntry<Uri> get casinoApiUri => _casinoApiUri;
  BoxEntry<String> get name => _name;
  BoxEntry<Color> get applicationColor => _applicationColor;
  BoxEntry<bool> get isDarkModeEnabled => _isDarkModeEnabled;

  Future<void> init() async {
    final box = await _hive.openBox('general');
    _casinoApiUri = ConvertingBoxEntry(
      box: box,
      key: 'api-url',
      defaultValue: Uri.parse('https://casino-310408.ew.r.appspot.com'),
      tinToTout: (String s) => Uri.parse(s),
      toutToTin: (Uri u) => u.toString(),
    );
    _name = BoxEntry(
      box: box,
      key: 'name',
      defaultValue: _nameGenerator(),
    );
    _applicationColor = ConvertingBoxEntry(
      box: box,
      key: 'application-color',
      defaultValue: const Color(0xFF000000),
      toutToTin: (Color c) => c.value,
      tinToTout: (int i) => Color(i),
    );
    _isDarkModeEnabled = BoxEntry(
      box: box,
      key: 'is-dark-mode-enabled',
      defaultValue: false,
    );
  }
}

class BoxEntry<T> {
  const BoxEntry({
    required Box box,
    required String key,
    required T defaultValue,
  })   : _box = box,
        _key = key,
        _defaultValue = defaultValue;

  final Box _box;
  final String _key;
  final T _defaultValue;

  Future<T> call() async {
    final value = await _box.get(_key);
    if (value == null) {
      await set(_defaultValue);
      return _defaultValue;
    }
    return value as T;
  }

  Future<void> set(T value) => _box.put(_key, value);

  Stream<BoxEvent<T>> get changes {
    return _box
        .watch(key: _key)
        .map((e) => BoxEvent<T>(e.key, e.value as T, e.deleted));
  }
}

class ConvertingBoxEntry<TIn, TOut> implements BoxEntry<TOut> {
  ConvertingBoxEntry({
    required Box box,
    required String key,
    required TOut defaultValue,
    required this.toutToTin,
    required this.tinToTout,
  }) : _baseEntry = BoxEntry(
          box: box,
          key: key,
          defaultValue: toutToTin(defaultValue),
        );

  final BoxEntry<TIn> _baseEntry;
  final TOut Function(TIn) tinToTout;
  final TIn Function(TOut) toutToTin;

  @override
  Box get _box => _baseEntry._box;

  @override
  TOut get _defaultValue => tinToTout(_baseEntry._defaultValue);

  @override
  String get _key => _baseEntry._key;

  @override
  Future<TOut> call() => _baseEntry().then(tinToTout);

  @override
  Future<void> set(TOut value) => _baseEntry.set(toutToTin(value));

  @override
  Stream<BoxEvent<TOut>> get changes {
    return _baseEntry.changes
        .map((e) => BoxEvent(e.key, tinToTout(e.value), e.deleted));
  }
}
