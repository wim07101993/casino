import 'package:bloc/bloc.dart';
import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_slot_machine_dialog_bloc.freezed.dart';

@freezed
class AddSlotMachineDialogEvent with _$AddSlotMachineDialogEvent {
  const factory AddSlotMachineDialogEvent.add() = _AddSlotmachineDialogEvent;
}

@freezed
class AddSlotMachineDialogState with _$AddSlotMachineDialogState {
  const factory AddSlotMachineDialogState({
    required TextEditingController name,
    @Default(false) isAdding,
    @Default(false) hasAdded,
    Object? error,
  }) = _AddSlotMachineDialogState;

  factory AddSlotMachineDialogState.initial(String name) {
    return AddSlotMachineDialogState(name: TextEditingController(text: name));
  }
}

class AddSlotMachineDialogBloc
    extends Bloc<AddSlotMachineDialogEvent, AddSlotMachineDialogState> {
  AddSlotMachineDialogBloc({
    required this.logger,
    required NameGenerator nameGenerator,
    required this.addSlotMachine,
  }) : super(AddSlotMachineDialogState.initial(nameGenerator()));

  final Logger logger;
  final AddSlotMachine addSlotMachine;

  @override
  Stream<AddSlotMachineDialogState> mapEventToState(
    AddSlotMachineDialogEvent event,
  ) {
    return event.when(
      add: _add,
    );
  }

  Stream<AddSlotMachineDialogState> _add() async* {
    try {
      yield state.copyWith(isAdding: true, hasAdded: false, error: null);
      await addSlotMachine(state.name.text);
      yield state.copyWith(isAdding: false, hasAdded: true);
    } catch (e, stackTrace) {
      logger.e('Error on add slot-machine (${state.name})', e, stackTrace);
      yield state.copyWith(isAdding: false, hasAdded: false, error: e);
    }
  }
}
