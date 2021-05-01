import 'package:casino_shared/casino_shared.dart';

class AddSlotMachine {
  const AddSlotMachine({
    required this.api,
  });

  final CasinoApi api;

  Future<void> call(String name) {
    return api.addSlotMachine(name);
  }
}
