import 'global_listenable_property.dart';
import 'local_db/theme_box.dart';

class SelectedThemeType extends BoxEntryWrapper<ThemeType> {
  SelectedThemeType({
    required ThemeBox db,
  }) : super(selector: () => db.themeType);
}
