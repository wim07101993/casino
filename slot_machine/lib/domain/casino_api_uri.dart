import 'global_listenable_property.dart';
import 'local_db/app_settings_box.dart';

class CasinoApiUri extends BoxEntryWrapper<Uri> {
  CasinoApiUri({
    required AppSettingsBox db,
  }) : super(selector: () => db.casinoApiUri);
}
