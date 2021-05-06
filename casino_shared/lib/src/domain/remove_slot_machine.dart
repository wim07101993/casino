import '../casino_api/casino_api.dart';

class RemoveSlotMachine {
  const RemoveSlotMachine({
    required this.api,
  });

  final CasinoApi api;

  Future<void> call(String id) {
    return api.removeSlotMachine(id);
  }
}
