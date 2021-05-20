import 'local_db/api_settings_box.dart';

class CasinoApiUri {
  const CasinoApiUri({
    required ApiSettingsBox db,
  }) : _db = db;

  final ApiSettingsBox _db;

  Future<Uri> call() => _db.casinoApiUri();
  Future<void> set(Uri value) => _db.casinoApiUri.set(value);
}
