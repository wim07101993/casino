import 'local_db/theme_box.dart';

class IsDarkModeEnabled {
  const IsDarkModeEnabled({
    required ThemeBox db,
  }) : _db = db;

  final ThemeBox _db;

  Future<bool> call() => _db.isDarkModeEnabled();
  // ignore: avoid_positional_boolean_parameters
  Future<void> set(bool value) => _db.isDarkModeEnabled.set(value);
  Stream<bool> get changes => _db.isDarkModeEnabled.changes.map((e) => e);
}
