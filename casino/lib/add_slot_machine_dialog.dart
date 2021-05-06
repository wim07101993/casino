import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/add_slot_machine_dialog_bloc.dart';
import 'main.dart';

class AddSlotMachineDialog extends StatefulWidget {
  const AddSlotMachineDialog({Key? key}) : super(key: key);

  @override
  _AddSlotMachineDialogState createState() => _AddSlotMachineDialogState();
}

class _AddSlotMachineDialogState extends State<AddSlotMachineDialog> {
  String? error;

  @override
  Widget build(BuildContext context) {
    return BlocBuilderListener<AddSlotMachineDialogBloc,
        AddSlotMachineDialogState>(
      create: (_) => di(),
      listener: _onStateChange,
      builder: (context, state) => SimpleDialog(
        title: const Text('New slot-machine'),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _input(state),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonBar(children: [
              _okButton(context, state),
              _cancelButton(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _input(AddSlotMachineDialogState state) {
    return TextField(
      controller: state.name,
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'Name of the slot-machine',
        errorText: error,
      ),
    );
  }

  Widget _okButton(BuildContext context, AddSlotMachineDialogState state) {
    return TextButton(
      onPressed: () {
        if (state.name.text.isEmpty) {
          setState(() => error = 'Please enter a name');
        } else {
          setState(() => error = null);
          BlocProvider.of<AddSlotMachineDialogBloc>(context)
              .add(const AddSlotMachineDialogEvent.add());
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

  void _onStateChange(BuildContext context, AddSlotMachineDialogState state) {
    if (state.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${state.error}'),
      ));
    }
  }
}
