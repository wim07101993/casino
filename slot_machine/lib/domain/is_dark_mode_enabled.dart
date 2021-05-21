import 'global_listenable_property.dart';
import 'local_db/theme_box.dart';

class IsDarkModeEnabled extends BoxEntryWrapper<bool> {
  IsDarkModeEnabled({
    required ThemeBox db,
  }) : super(selector: () => db.isDarkModeEnabled);
}
