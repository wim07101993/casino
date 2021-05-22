import 'package:flutter/painting.dart';

import 'global_listenable_property.dart';
import 'local_db/theme_box.dart';

class SecondaryColor extends BoxEntryWrapper<Color> {
  SecondaryColor({
    required ThemeBox db,
  }) : super(selector: () => db.secondaryColor);
}
