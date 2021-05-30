import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/game_bloc.dart';
import 'main.dart';
import 'rolling_symbol.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilderListener<GameBloc, GameState>(
      create: (_) => di(),
      listener: _onStateChanged,
      builder: (context, state) {
        return RawKeyboardListener(
          focusNode: FocusNode()..requestFocus(),
          onKey: (e) => onKey(context, state, e),
          child: GestureDetector(
            onTap: () => onTap(context),
            child: _numbers(state),
          ),
        );
      },
    );
  }

  Widget _numbers(GameState state) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: state.symbolControllers.isEmpty
          ? null
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                state.symbolControllers.length,
                (i) => RollingSymbol(
                  controller: state.symbolControllers[i],
                  symbols: state.symbols,
                ),
              ),
            ),
    );
  }

  void onTap(BuildContext context) {
    BlocProvider.of<GameBloc>(context).add(const GameEvent.roll());
  }

  void onKey(BuildContext context, GameState state, RawKeyEvent value) {
    if (state.symbolControllers.any((e) => e.isRolling)) {
      return;
    }
    if (value is RawKeyUpEvent &&
        (value.logicalKey == LogicalKeyboardKey.space ||
            value.logicalKey == LogicalKeyboardKey.enter)) {
      BlocProvider.of<GameBloc>(context).add(const GameEvent.roll());
    }
  }

  void _onStateChanged(BuildContext context, GameState state) {
    final error = state.error;
    if (error != null) {
      showError(context, error);
    }
  }
}
