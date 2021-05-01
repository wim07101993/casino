import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';
import 'number.dart';
import 'number_controller.dart';

class Game extends StatefulWidget {
  const Game({
    Key? key,
    this.numberCount = 4,
  }) : super(key: key);

  final int numberCount;

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  late List<NumberController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = Iterable.generate(
      widget.numberCount,
      (i) => NumberController(random: di()),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode()..requestFocus(),
      onKey: onKey,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              child: FittedBox(child: _numbers()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _numbers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.numberCount,
        (i) => Number(controller: _controllers[i]),
      ),
    );
  }

  void onTap() => roll();

  void onKey(RawKeyEvent value) {
    if (value.character == ' ') {
      roll();
    }
  }

  void roll() {
    for (final controller in _controllers) {
      controller.roll();
    }
  }
}
