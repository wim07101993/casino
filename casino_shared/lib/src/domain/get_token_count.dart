import '../casino_api/casino_api.dart';

class GetTokenCount {
  const GetTokenCount({
    required this.api,
  });

  final CasinoApi api;

  Future<int> call(String id) => api.getTokens(id);
}
