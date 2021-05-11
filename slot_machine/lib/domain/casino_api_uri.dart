import '../data/local_db/general_box.dart';

class CasinoApiUri {
  const CasinoApiUri({
    required GeneralBox generalBox,
  }) : _generalBox = generalBox;

  final GeneralBox _generalBox;

  Future<Uri> call() => _generalBox.casinoApiUri().then(Uri.parse);

  Future<void> set(Uri value) => _generalBox.casinoApiUri.set(value.toString());
}
