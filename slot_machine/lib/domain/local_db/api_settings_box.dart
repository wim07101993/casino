import 'package:casino_shared/casino_shared.dart';
import 'package:hive/hive.dart' hide BoxEvent;

import 'box_entry.dart';
import 'converting_box_entry.dart';

class ApiSettingsBox {
  ApiSettingsBox({
    required HiveInterface hive,
    required NameGenerator nameGenerator,
  })  : _nameGenerator = nameGenerator,
        _box = hive.openBox('general');

  static const String casinoApiUriKey = 'api-url';
  static const String nameKey = 'name';

  final Future<Box> _box;
  final NameGenerator _nameGenerator;

  late final BoxEntry<Uri> casinoApiUri = ConvertingBoxEntry(
    box: _box,
    key: 'api-url',
    defaultValue: Uri.parse('https://casino-310408.ew.r.appspot.com'),
    tinToTout: (String s) => Uri.parse(s),
    toutToTin: (Uri u) => u.toString(),
  );

  late final BoxEntry<String> name = BoxEntry(
    box: _box,
    key: 'name',
    defaultValue: _nameGenerator(),
  );
}
