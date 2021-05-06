import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:casino_shared/casino_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../local_db/general_box.dart';
import '../number_controller.dart';

part 'game_bloc.freezed.dart';

@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.roll() = _GameEvent;
}

@freezed
class GameState with _$GameState {
  const factory GameState({
    required List<NumberController> numbers,
    String? name,
    @Default(0) int tokenCount,
    @Default(false) bool isLoading,
    Object? error,
  }) = _GameState;
}

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required this.generalBox,
    required this.logger,
    required this.getSlotMachineByName,
    required this.addSlotMachine,
    required this.setTokenCount,
    required this.slotMachineChanges,
    required this.random,
  }) : super(const GameState(numbers: [])) {
    _loadInitial().forEach(emit);
    generalBox
        .stream<String>(key: GeneralBox.nameKey)
        .forEach((e) => emit(state.copyWith(name: e.value)));
    generalBox
        .stream<int>(key: GeneralBox.numberOfSymbolsKey)
        .forEach((e) => _updateSymbols(e.value).forEach(emit));
    _registerApiChanges();
  }

  final AddSlotMachine addSlotMachine;
  final GeneralBox generalBox;
  final GetSlotMachineByName getSlotMachineByName;
  final Logger logger;
  final SetTokenCount setTokenCount;
  final SlotMachineChanges slotMachineChanges;
  final Random random;

  @override
  Stream<GameState> mapEventToState(GameEvent event) {
    return event.when(
      roll: _roll,
    );
  }

  Stream<GameState> _roll() async* {
    final id = state.id;
    yield state.copyWith(error: null);
    if (id == null) {
      logger.wtf('Rolling before id was gotten!!');
      return;
    }
    if (state.tokenCount <= 0) {
      yield state.copyWith(error: 'Cannot play without tokens!');
      return;
    }
    try {
      logger.i('Rolling');
      final newTokenCount = state.tokenCount - 1;
      await setTokenCount(id, newTokenCount);
      yield state.copyWith(tokenCount: newTokenCount);
      for (final number in state.numbers) {
        number.roll();
      }
    } catch (e, stackTrace) {
      logger.e('Error on roll', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }

  Stream<GameState> _loadInitial() async* {
    logger.i('Loading initial state');
    yield state.copyWith(isLoading: true, error: null);
    final name = await generalBox.name;
    yield state.copyWith(
      name: name,
      numbers: await generalBox.numberOfSymbols.then(_generateNumbers),
    );

    try {
      final slotMachine = await getSlotMachineByName(name);
      yield state.copyWith(
        isLoading: false,
        id: slotMachine.id,
        tokenCount: slotMachine.tokens,
      );
      return;
    } catch (e, stackTrace) {
      final isNotFound = e is CasinoApiException &&
          e.maybeWhen(notFound: (_) => true, orElse: () => false);
      if (!isNotFound) {
        logger.e('Error on getting slot-machine by name', e, stackTrace);
        yield state.copyWith(isLoading: false, error: e);
        return;
      }
    }

    // if the slot-machine does not exist yet, create one.
    logger.i('Slot-machine with name $name not found, creating new one');
    try {
      final id = await addSlotMachine(name);
      yield state.copyWith(isLoading: false, id: id, tokenCount: 0);
    } catch (e, stackTrace) {
      logger.e('Error on adding slot-machine', e, stackTrace);
      yield state.copyWith(isLoading: false, error: e);
      return;
    }
  }

  Stream<GameState> _updateSymbols(int count) async* {
    logger.i('Updating symbol count to $count');
    try {
      yield state.copyWith(numbers: _generateNumbers(count));
    } catch (e, stackTrace) {
      logger.e('Error on updating the symbols', e, stackTrace);
      yield state.copyWith(isLoading: false, error: e);
      return;
    }
  }

  List<NumberController> _generateNumbers(int count) {
    if (state.numbers.length == count) {
      return state.numbers;
    } else {
      return Iterable.generate(count, (i) {
        return i < state.numbers.length
            ? state.numbers[i]
            : NumberController(random: random);
      }).toList();
    }
  }

  void _registerApiChanges() {
    slotMachineChanges.stream
        .where((_) => state.id != null)
        .map((list) => list.firstWhere((e) => e.id == state.id))
        .where((e) => e.name != state.name || e.tokens != state.tokenCount)
        .forEach((e) {
      generalBox.setName(e.name);
      emit(state.copyWith(tokenCount: e.tokens));
    });
  }
}
