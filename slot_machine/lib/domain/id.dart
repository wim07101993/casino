import 'package:casino_shared/casino_shared.dart';

import 'local_db/app_settings_box.dart';

class Id {
  Id({
    required CasinoApi api,
    required AppSettingsBox db,
  })  : _api = api,
        _db = db;

  String? _id;

  final AppSettingsBox _db;
  final CasinoApi _api;

  Future<String> call() => _id != null ? Future.value(_id) : _fetchId();

  Future<String> _fetchId() async {
    final name = await _db.name();
    try {
      final slotMachine = await _api.getSlotMachineByName(name);
      return _id = slotMachine.id;
    } on CasinoApiException catch (e) {
      final isNotFound = e.maybeWhen(
        orElse: () => false,
        notFound: (_) => true,
      );
      if (isNotFound) {
        return _api.addSlotMachine(name);
      }
      rethrow;
    }
  }
}
