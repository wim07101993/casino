import 'global_listenable_property.dart';
import 'local_db/app_settings_box.dart';

class IsMouseEnabled extends BoxEntryWrapper<bool> {
  IsMouseEnabled({
    required AppSettingsBox db,
  }) : super(selector: () => db.isMouseEnabled);
}
