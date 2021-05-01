import 'package:casino_shared/casino_shared.dart';

class GetTokenCount {
  const GetTokenCount({
    required this.api,
  });

  final CasinoApi api;

  Future<int> call(String id) => api.getTokens(id);
}
