import 'package:flutter/painting.dart';

import 'local_db/theme_box.dart';

class PrimaryColor {
  const PrimaryColor({
    required ThemeBox db,
  }) : _db = db;

  final ThemeBox _db;

  Future<Color> call() => _db.primaryColor();
  Future<void> set(Color value) => _db.primaryColor.set(value);
  Stream<Color> get changes => _db.primaryColor.changes.map((e) => e);
}
