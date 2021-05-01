import 'package:casino_shared/casino_shared.dart';

class SetTokenCount {
  const SetTokenCount({
    required this.api,
  });

  final CasinoApi api;

  Future<void> call(String id, int count) => api.setTokens(id, count);
}
