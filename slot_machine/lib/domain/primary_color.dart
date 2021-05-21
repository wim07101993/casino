import 'package:flutter/painting.dart';

import 'global_listenable_property.dart';
import 'local_db/theme_box.dart';

class PrimaryColor extends BoxEntryWrapper<Color> {
  PrimaryColor({
    required ThemeBox db,
  }) : super(selector: () => db.primaryColor);
}
