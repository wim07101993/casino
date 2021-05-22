import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../domain/app_theme.dart';
import '../domain/token_count.dart';
import '../symbol_controller.dart';

part 'game_bloc.freezed.dart';

const numberOfSymbols = 4;

@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.roll() = _GameEvent;
}

@freezed
class GameState with _$GameState {
  const factory GameState({
    required List<SymbolController> symbolControllers,
    required List<Widget> symbols,
    Object? error,
  }) = _GameState;

  factory GameState.initial({
    required Random random,
    int numberOfSymbols = numberOfSymbols,
  }) {
    final symbols = AppTheme.defaultTheme.symbols;
    return GameState(
      symbolControllers: Iterable.generate(numberOfSymbols, (_) {
        return SymbolController(random: random);
      }).toList(),
      symbols: symbols,
    );
  }
}

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required Logger logger,
    required TokenCount tokenCount,
    required Random random,
    required AppTheme theme,
  })  : _logger = logger,
        _tokenCount = tokenCount,
        super(GameState.initial(random: random)) {
    theme().then((e) => emit(state.copyWith(error: null, symbols: e.symbols)));
    theme.changes.forEach((e) {
      emit(state.copyWith(error: null, symbols: e.symbols));
    });
  }

  final Logger _logger;
  final TokenCount _tokenCount;

  @override
  Stream<GameState> mapEventToState(GameEvent event) {
    return event.when(
      roll: _roll,
    );
  }

  Stream<GameState> _roll() async* {
    if (state.symbolControllers.any((e) => e.isRolling)) {
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
      final rollers = List.of(state.symbolControllers.map((c) => c.roll()));
      await Future.wait(rollers);
      final distinctCount =
          state.symbolControllers.map((e) => e.value).toSet().length;
      switch (distinctCount) {
        case 1:
          await _tokenCount.set(newTokenCount + 77);
          break;
        case 2:
          await _tokenCount.set(newTokenCount + 2);
          break;
        case 3:
          await _tokenCount.set(newTokenCount + 1);
      }
    } catch (e, stackTrace) {
      _logger.e('Error on roll', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }
}
