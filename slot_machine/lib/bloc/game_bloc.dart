import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:casino_shared/casino_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../domain/token_count.dart';
import '../number_controller.dart';

part 'game_bloc.freezed.dart';

const numberOfSymbols = 4;

@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.roll() = _GameEvent;
}

@freezed
class GameState with _$GameState {
  const factory GameState({
    required List<NumberController> numbers,
    Object? error,
  }) = _GameState;

  factory GameState.initial({
    required Random random,
    int numberOfSymbols = numberOfSymbols,
  }) {
    return GameState(
      numbers: Iterable.generate(numberOfSymbols, (_) {
        return NumberController(random: random);
      }).toList(),
    );
  }
}

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required Logger logger,
    required TokenCount tokenCount,
    required Random random,
  })   : _logger = logger,
        _tokenCount = tokenCount,
        super(GameState.initial(random: random));

  final Logger _logger;
  final TokenCount _tokenCount;

  @override
  Stream<GameState> mapEventToState(GameEvent event) {
    return event.when(
      roll: _roll,
    );
  }

  Stream<GameState> _roll() async* {
    if (state.numbers.any((e) => e.isRolling)) {
      print('clicked while rolling');
      return;
    }
    yield state.copyWith(error: null);
    try {
      final tokenCount = await _tokenCount();
      if (tokenCount <= 0) {
        yield state.copyWith(error: 'Cannot play without tokens!');
        return;
      }
      _logger.i('Rolling');
      final newTokenCount = tokenCount - 1;
      await _tokenCount.set(newTokenCount);
      for (final number in state.numbers) {
        number.roll();
      }
    } catch (e, stackTrace) {
      _logger.e('Error on roll', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }
}
