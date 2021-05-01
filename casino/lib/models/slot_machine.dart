part of 'models.dart';

@freezed
class SlotMachine with _$SlotMachine {
  const factory SlotMachine({
    required String id,
    required String name,
    required int tokens,
  }) = _SlotMachine;
}
