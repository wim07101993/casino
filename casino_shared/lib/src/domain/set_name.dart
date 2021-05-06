import '../casino_api/casino_api.dart';

class SetName {
  const SetName({
    required this.api,
  });

  final CasinoApi api;

  Future<void> call(String id, String name) => api.setName(id, name);
}
