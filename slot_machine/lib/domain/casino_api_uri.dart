import 'global_listenable_property.dart';
import 'local_db/api_settings_box.dart';

class CasinoApiUri extends BoxEntryWrapper<Uri> {
  CasinoApiUri({
    required ApiSettingsBox db,
  }) : super(selector: () => db.casinoApiUri);
}
