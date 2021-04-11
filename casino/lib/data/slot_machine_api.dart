import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:slot_machine_controller/data/app_settings.dart';

import '../helpers/http_helpers.dart';
import '../helpers/uri_extensions.dart';

part 'slot_machine_api.freezed.dart';
part 'slot_machine_api.g.dart';

@freezed
class SlotMachine with _$SlotMachine {
  const factory SlotMachine({
    required String id,
    required int tokens,
  }) = _SlotMachine;

  factory SlotMachine.fromJson(Map<String, dynamic> json) =>
      _$SlotMachineFromJson(json);
}

class SlotMachineApi {
  const SlotMachineApi({
    required this.httpClient,
    required this.appSettings,
  });

  final http.Client httpClient;
  final AppSettings appSettings;

  Uri get uri =>
      appSettings.slotMachineApiUri.replace(pathSegments: ['casino']);

  Future<String> addSlotMachine() async {
    final response = await httpClient.post(uri);
    throwIfNotOk(response);
    return response.body;
  }

  Future<List<SlotMachine>> listSlotMachines() async {
    final response = await httpClient.get(uri);
    throwIfNotOk(response);
    final jsonList = jsonDecode(response.body) as List;
    return jsonList
        .cast<Map<String, dynamic>>()
        .map((json) => SlotMachine.fromJson(json))
        .toList();
  }

  Future<int> getTokenCount(String id) async {
    final response = await httpClient.get(uri.addPathSegments([id, 'tokens']));
    throwIfNotOk(response);
    return int.parse(response.body);
  }

  Future<void> setTokenCount(String id, int count) async {
    final response = await httpClient.put(uri.replace(
      pathSegments: [...uri.pathSegments, id, 'tokens'],
      queryParameters: {'amount': count},
    ));
    throwIfNotOk(response);
  }

  Future<void> deleteSlotMachine(String id) async {
    final response = await httpClient.delete(uri.addPathSegments([id]));
    throwIfNotOk(response);
  }
}
