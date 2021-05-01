import 'package:casino_shared/casino_shared.dart';

class RemoveSlotMachine {
  const RemoveSlotMachine({
    required this.api,
  });

  final CasinoApi api;

  Future<void> call(String id) {
    return api.removeSlotMachine(id);
  }
}
