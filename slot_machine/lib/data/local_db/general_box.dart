import 'package:casino_shared/casino_shared.dart';
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
  late BoxEntry<String> _casinoApiUri;
  late BoxEntry<String> _name;

  BoxEntry<String> get casinoApiUri => _casinoApiUri;
  BoxEntry<String> get name => _name;

  Future<void> init() async {
    final box = await _hive.openBox('general');
    _casinoApiUri = BoxEntry(
      box: box,
      key: 'api-url',
      defaultValue: 'https://casino-310408.ew.r.appspot.com',
    );
    _name = BoxEntry(
      box: box,
      key: 'name',
      defaultValue: _nameGenerator(),
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

class UriBoxEntry implements BoxEntry<Uri> {
  UriBoxEntry({
    required Box box,
    required String key,
    required Uri defaultValue,
  }) : _baseEntry = BoxEntry(
          box: box,
          key: key,
          defaultValue: defaultValue.toString(),
        );

  final BoxEntry<String> _baseEntry;

  @override
  Box get _box => _baseEntry._box;

  @override
  Uri get _defaultValue => Uri.parse(_baseEntry._defaultValue);

  @override
  String get _key => _baseEntry._key;

  @override
  Future<Uri> call() => _baseEntry().then(Uri.parse);

  @override
  Future<void> set(Uri value) => _baseEntry.set(value.toString());

  @override
  Stream<BoxEvent<Uri>> get changes {
    return _baseEntry.changes
        .map((e) => BoxEvent(e.key, Uri.parse(e.value), e.deleted));
  }
}
