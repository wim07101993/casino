import 'package:casino_shared/casino_shared.dart';
import 'package:hive/hive.dart' hide BoxEvent;

import 'box_event.dart';

class GeneralBox {
  GeneralBox({
    required HiveInterface hive,
    required NameGenerator nameGenerator,
  })   : _nameGenerator = nameGenerator,
        box = hive.openBox('general');

  static const String casinoApiUriKey = 'api-url';
  static const String nameKey = 'name';
  static const String numberOfSymbolsKey = 'number-of-symbols';

  final Future<Box> box;
  final NameGenerator _nameGenerator;

  Stream<BoxEvent<T>> stream<T>({dynamic key}) async* {
    final box = await this.box;
    yield* box
        .watch(key: key)
        .map((e) => BoxEvent<T>(e.key, e.value as T, e.deleted));
  }

  Future<Uri> get casinoApiUri {
    return _get<String>(
      casinoApiUriKey,
      'https://casino-310408.ew.r.appspot.com',
    ).then(Uri.parse);
  }

  Future<String> get name => _get<String>(nameKey, _nameGenerator.generate());
  Future<int> get numberOfSymbols => _get<int>(numberOfSymbolsKey, 4);

  Future<void> setCasinoApiUri(Uri value) {
    return _put(casinoApiUriKey, value.toString());
  }

  Future<void> setName(String value) => _put(nameKey, value);
  Future<void> setNumberOfSymbols(int value) {
    return _put(numberOfSymbolsKey, value);
  }

  Future<T> _get<T>(String key, T defaultValue) {
    return box.then((box) async {
      final value = await box.get(key);
      if (value == null) {
        await _put(key, defaultValue);
        return defaultValue;
      }
      return value as T;
    });
  }

  Future<void> _put<T>(String key, T value) {
    return box.then((box) => box.put(key, value));
  }

  Future<void> drop() => box.then((box) => box.clear());
}
