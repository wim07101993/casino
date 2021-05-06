// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casino_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SlotMachineDTO _$_$_SlotMachineDTOFromJson(Map<String, dynamic> json) {
  return _$_SlotMachineDTO(
    id: json['id'] as String,
    name: json['name'] as String,
    tokens: json['tokens'] as int,
  );
}

Map<String, dynamic> _$_$_SlotMachineDTOToJson(_$_SlotMachineDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tokens': instance.tokens,
    };
