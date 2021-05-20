import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:casino_shared/casino_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'slot_machine_bloc.freezed.dart';

@freezed
class SlotMachineEvent with _$SlotMachineEvent {
  const factory SlotMachineEvent.load(String id) = _Load;
  const factory SlotMachineEvent.addToken() = _AddToken;
  const factory SlotMachineEvent.removeToken() = _RemoveToken;
  const factory SlotMachineEvent.setTokenCount(int count) = _SetTokenCount;
}

@freezed
class SlotMachineState with _$SlotMachineState {
  const factory SlotMachineState({
    String? id,
    int? tokens,
    Object? error,
  }) = _SlotMachineState;
}

class SlotMachineBloc extends Bloc<SlotMachineEvent, SlotMachineState> {
  SlotMachineBloc({
    required this.api,
    required this.logger,
    required SlotMachineChanges slotMachinesChanges,
  }) : super(const SlotMachineState()) {
    streamSubscription = slotMachinesChanges.stream
        .map((list) {
          return list
              .cast<SlotMachine?>()
              .firstWhere((e) => e!.id == state.id, orElse: () => null);
        })
        .where((e) => e != null)
        .cast<SlotMachine>()
        .listen(_onSlotMachineChanged);
  }

  final CasinoApi api;
  final Logger logger;

  late StreamSubscription<SlotMachine> streamSubscription;

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }

  @override
  Stream<SlotMachineState> mapEventToState(SlotMachineEvent event) async* {
    logger.i('Event: $event');
    yield* event.when(
      load: _load,
      addToken: _addToken,
      removeToken: _removeOne,
      setTokenCount: _setTokenCount,
    );
  }

  Stream<SlotMachineState> _load(String id) async* {
    try {
      final tokens = await api.getTokens(id);
      yield state.copyWith(id: id, tokens: tokens, error: null);
    } catch (e, stackTrace) {
      logger.e('Error on load slot-machine', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }

  Stream<SlotMachineState> _addToken() {
    if (state.tokens != null && state.tokens! < (1 << 31)) {
      final tokens = state.tokens! + 1;
      return _setTokenCount(tokens);
    }
    return const Stream.empty();
  }

  Stream<SlotMachineState> _removeOne() {
    if (state.tokens != null && state.tokens! > 0) {
      final tokens = state.tokens! - 1;
      return _setTokenCount(tokens);
    }
    return const Stream.empty();
  }

  Stream<SlotMachineState> _setTokenCount(int count) async* {
    try {
      final id = state.id;
      if (id == null) {
        logger.wtf('setting token count without having an id!!');
        return;
      }
      await api.setTokens(id, count);
      yield state.copyWith(tokens: count, error: null);
    } catch (e, stackTrace) {
      logger.e('Error on set token count (${state.tokens})', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }

  void _onSlotMachineChanged(SlotMachine event) {
    logger.i('Slot-machine changed: $event');
    emit(state.copyWith(tokens: event.tokens));
  }
}
