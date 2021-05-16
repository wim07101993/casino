import 'package:flutter/painting.dart';

import '../data/local_db/general_box.dart';

class PrimaryColor {
  const PrimaryColor({
    required GeneralBox generalBox,
  }) : _generalBox = generalBox;

  final GeneralBox _generalBox;

  Future<Color> call() => _generalBox.primaryColor();

  Future<void> set(Color value) => _generalBox.primaryColor.set(value);

  Stream<Color> get changes {
    return _generalBox.primaryColor.changes.map((e) => e.value);
  }
}
