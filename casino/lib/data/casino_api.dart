import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';

import '../utils/uri_extensions.dart';
import 'app_settings.dart';

part 'casino_api.freezed.dart';
part 'casino_api.g.dart';

@freezed
class SlotMachine with _$SlotMachine {
  const factory SlotMachine.create({
    required String id,
    required String name,
    required int tokens,
  }) = _SlotMachine;

  factory SlotMachine.fromJson(Map<String, dynamic> json) =>
      _$SlotMachineFromJson(json);
}

class CasinoApi {
  const CasinoApi({
    required this.http,
    required this.config,
  });

  final Client http;
  final AppSettings config;

  Uri get uri => config.apiUri.addPathSegments(['casino']);

  Future<SlotMachine> addSlotMachine(String name) async {
    final response = await http.post(
      uri.addPathSegments(['slot-machines']),
      body: jsonEncode({'name': name}),
    );
    validateResponse(response);
    return SlotMachine.create(
      id: response.body,
      name: name,
      tokens: 0,
    );
  }

  Future<List<SlotMachine>> listSlotMachines() async {
    final response = await http.get(
      uri.addPathSegments(['slot-machines']),
    );
    validateResponse(response);
    final list = jsonDecode(response.body) as List;
    return list
        .cast<Map<String, dynamic>>()
        .map((json) => SlotMachine.fromJson(json))
        .toList();
  }

  Future<int> getTokens(String id) async {
    final response = await http.get(uri.addPathSegments([id, 'tokens']));
    validateResponse(response);
    return int.parse(response.body);
  }

  Future<void> setTokens(String id, int count) async {
    assert(count >= 0);
    final response = await http.put(uri.replace(
      pathSegments: [...uri.pathSegments, id, 'tokens'],
      queryParameters: {'count': count.toString()},
    ));
    validateResponse(response);
  }

  Future<void> removeSlotMachine(String id) async {
    final response = await http.delete(uri.addPathSegments([id]));
    validateResponse(response);
  }

  void validateResponse(Response response) {
    if (response.statusCode >= 400) {
      throw response.body;
    }
  }
}
