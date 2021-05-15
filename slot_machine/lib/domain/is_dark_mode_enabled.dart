import '../data/local_db/general_box.dart';

class IsDarkModeEnabled {
  const IsDarkModeEnabled({
    required GeneralBox generalBox,
  }) : _generalBox = generalBox;

  final GeneralBox _generalBox;

  Future<bool> call() => _generalBox.isDarkModeEnabled();

  // ignore: avoid_positional_boolean_parameters
  Future<void> set(bool value) => _generalBox.isDarkModeEnabled.set(value);

  Stream<bool> get changes {
    return _generalBox.isDarkModeEnabled.changes.map((e) => e.value);
  }
}
