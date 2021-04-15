import 'package:flutter/material.dart';

import 'data/casino_api.dart';
import 'main.dart';

class SlotMachineControls extends StatefulWidget {
  const SlotMachineControls({
    Key? key,
    required this.slotMachine,
  }) : super(key: key);

  final SlotMachine slotMachine;

  @override
  _SlotMachineControlsState createState() => _SlotMachineControlsState();
}

class _SlotMachineControlsState extends State<SlotMachineControls> {
  final CasinoApi casinoApi = di();
  late int tokenCount;
  late TextEditingController tokenCountController;
  String? error;

  @override
  void initState() {
    super.initState();
    tokenCountController = TextEditingController(
      text: widget.slotMachine.tokens.toString(),
    )..addListener(onTokenCountChange);
    tokenCount = widget.slotMachine.tokens;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(children: [
        if (error != null) _errorMessage(),
        _removeTokenButton(),
        _amountField(),
        _addTokenButton(),
        _removeButton(context),
      ]),
    );
  }

  Widget _errorMessage() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Text(
        error!,
        style: TextStyle(color: Theme.of(context).errorColor),
      ),
    );
  }

  Widget _removeTokenButton() {
    return IconButton(
      icon: const Icon(Icons.remove),
      onPressed: () {
        tokenCount--;
        tokenCountController.text = tokenCount.toString();
      },
    );
  }

  Widget _addTokenButton() {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        tokenCount++;
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

  Widget _removeButton(BuildContext context) {
    return IconButton(
      onPressed: () async {
        try {
          if (!await _askWhetherUserIsSureToDeleteSlotMachine(context)) {
            return;
          }
          await casinoApi.removeSlotMachine(widget.slotMachine.id);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.toString().trim()),
          ));
        }
      },
      color: Theme.of(context).errorColor,
      icon: const Icon(Icons.delete),
    );
  }

  Future<void> onTokenCountChange() async {
    final value = int.tryParse(tokenCountController.text);
    if (value == null) {
      setState(() => error = 'Please enter a number');
      return;
    }
    tokenCount = value;
    try {
      await casinoApi.setTokens(widget.slotMachine.id, tokenCount);
      setState(() => error = null);
    } catch (e) {
      setState(() => error = e.toString().trim());
    }
  }

  Future<bool> _askWhetherUserIsSureToDeleteSlotMachine(
    BuildContext context,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete slot-machine'),
        content: const Text('Are you sure?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
