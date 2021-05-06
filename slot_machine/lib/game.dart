import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/game_bloc.dart';
import 'main.dart';
import 'number.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilderListener<GameBloc, GameState>(
      create: (_) => di(),
      listener: _onStateChanged,
      builder: (context, state) => RawKeyboardListener(
        focusNode: FocusNode()..requestFocus(),
        onKey: (e) => onKey(context, e),
        child: GestureDetector(
          onTap: () => onTap(context),
          child: Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            child: state.numbers.isEmpty
                ? null
                : FittedBox(child: _numbers(state)),
          ),
        ),
      ),
    );
  }

  Widget _numbers(GameState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        state.numbers.length,
        (i) => Number(controller: state.numbers[i]),
      ),
    );
  }

  void onTap(BuildContext context) {
    BlocProvider.of<GameBloc>(context).add(const GameEvent.roll());
  }

  void onKey(BuildContext context, RawKeyEvent value) {
    if (value.character == ' ') {
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
