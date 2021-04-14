import 'package:flutter/material.dart';

import 'data/casino_api.dart';
import 'main.dart';

class SlotMachineControls extends StatefulWidget {
  SlotMachineControls({
    Key? key,
    required this.slotMachine,
  })   : casinoApi = di(),
        super(key: key);

  final CasinoApi casinoApi;
  final SlotMachine slotMachine;

  @override
  _SlotMachineControlsState createState() => _SlotMachineControlsState();
}

class _SlotMachineControlsState extends State<SlotMachineControls> {
  late int tokenCount;
  late TextEditingController tokenCountController;

  @override
  void initState() {
    super.initState();
    tokenCountController = TextEditingController(
      text: widget.slotMachine.tokens.toString(),
    );
    tokenCount = widget.slotMachine.tokens;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(children: [
        _removeTokenButton(),
        _amountField(),
        _addTokenButton(),
      ]),
    );
  }

  Widget _removeTokenButton() {
    return IconButton(
      icon: const Icon(Icons.remove),
      onPressed: () {
        tokenCount--;
        widget.casinoApi.setTokens(widget.slotMachine.id, tokenCount);
        tokenCountController.text = tokenCount.toString();
      },
    );
  }

  Widget _addTokenButton() {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        tokenCount++;
        widget.casinoApi.setTokens(widget.slotMachine.id, tokenCount);
        tokenCountController.text = tokenCount.toString();
      },
    );
  }

  Widget _amountField() {
    return IntrinsicWidth(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 50),
        child: TextField(
          controller: tokenCountController,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
