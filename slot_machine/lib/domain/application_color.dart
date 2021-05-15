import 'package:flutter/painting.dart';

import '../data/local_db/general_box.dart';

class ApplicationColor {
  const ApplicationColor({
    required GeneralBox generalBox,
  }) : _generalBox = generalBox;

  final GeneralBox _generalBox;

  Future<Color> call() => _generalBox.applicationColor();

  Future<void> set(Color value) => _generalBox.applicationColor.set(value);

  Stream<Color> get changes {
    return _generalBox.applicationColor.changes.map((e) => e.value);
  }
}
