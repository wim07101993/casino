import '../casino_api/casino_api.dart';

class AddSlotMachine {
  const AddSlotMachine({
    required this.api,
  });

  final CasinoApi api;

  Future<String> call(String name) {
    return api.addSlotMachine(name);
  }
}
