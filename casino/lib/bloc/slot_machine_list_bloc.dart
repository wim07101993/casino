import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:casino_shared/casino_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'slot_machine_list_bloc.freezed.dart';

@freezed
class SlotMachineListEvent with _$SlotMachineListEvent {
  const factory SlotMachineListEvent.addSlotMachine({
    required String name,
  }) = _AddSlotMachine;

  const factory SlotMachineListEvent.removeSlotMachine({
    required String id,
  }) = _RemoveSlotMachine;
}

@freezed
class SlotMachineListState with _$SlotMachineListState {
  const factory SlotMachineListState({
    @Default([]) List<SlotMachine> slotMachines,
    @Default(false) bool isLoading,
    Object? error,
  }) = _SlotMachineListState;
}

class SlotMachineListBloc
    extends Bloc<SlotMachineListEvent, SlotMachineListState> {
  SlotMachineListBloc({
    required this.logger,
    required this.addSlotMachine,
    required this.removeSlotMachine,
    required SlotMachineChanges slotMachinesChanges,
  }) : super(const SlotMachineListState()) {
    streamSubscription =
        slotMachinesChanges.stream.listen(_onSlotMachinesChanged);
  }

  final Logger logger;
  final AddSlotMachine addSlotMachine;
  final RemoveSlotMachine removeSlotMachine;

  late StreamSubscription streamSubscription;

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }

  @override
  Stream<SlotMachineListState> mapEventToState(
      SlotMachineListEvent event) async* {
    logger.i('Event: $event');
    yield* event.when(
      addSlotMachine: _addSlotMachine,
      removeSlotMachine: _removeSlotMachine,
    );
  }

  Stream<SlotMachineListState> _addSlotMachine(String name) async* {
    try {
      yield state.copyWith(isLoading: true, error: null);
      await addSlotMachine(name);
      yield state.copyWith(isLoading: false);
    } catch (e, stackTrace) {
      logger.e('Error on adding slot-machine $name', e, stackTrace);
      yield state.copyWith(isLoading: false, error: e);
    }
  }

  Stream<SlotMachineListState> _removeSlotMachine(String id) async* {
    try {
      yield state.copyWith(isLoading: true, error: null);
      await removeSlotMachine(id);
      yield state.copyWith(
        isLoading: false,
        slotMachines: state.slotMachines..removeWhere((e) => e.id == id),
      );
    } catch (e, stackTrace) {
      logger.e('Error on removing slot-machine $id', e, stackTrace);
      yield state.copyWith(isLoading: false, error: e);
    }
  }

  void _onSlotMachinesChanged(List<SlotMachine> event) {
    logger.i('slot-machines changed $event');
    emit(state.copyWith(slotMachines: event.toList()));
  }
}
