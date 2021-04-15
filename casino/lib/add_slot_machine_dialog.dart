import 'package:flutter/material.dart';

class AddSlotMachineDialog extends StatefulWidget {
  const AddSlotMachineDialog({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  _AddSlotMachineDialogState createState() => _AddSlotMachineDialogState();
}

class _AddSlotMachineDialogState extends State<AddSlotMachineDialog> {
  String? error;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('New slot-machine'),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _input(),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ButtonBar(children: [_okButton(), _cancelButton()]),
        ),
      ],
    );
  }

  Widget _input() {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'Name of the slot-machine',
        errorText: error,
      ),
    );
  }

  Widget _okButton() {
    return TextButton(
      onPressed: () {
        if (widget.controller.text.isEmpty) {
          setState(() => error = 'Please enter a name');
        } else {
          setState(() => error = null);
          Navigator.pop(context, true);
        }
      },
      child: const Text('ok'),
    );
  }

  Widget _cancelButton() {
    return TextButton(
      onPressed: () => Navigator.pop(context, false),
      child: const Text('cancel'),
    );
  }
}
