import 'package:casino_shared/casino_shared.dart';

import 'local_db/api_settings_box.dart';

class Id {
  Id({
    required CasinoApi api,
    required ApiSettingsBox db,
  })   : _api = api,
        _db = db;

  String? _id;

  final ApiSettingsBox _db;
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
