import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_slot_machine_dialog.dart';
import 'bloc/add_slot_machine_dialog_bloc.dart';
import 'main.dart';
import 'slot_machine_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: SlotMachineList(
              onAddSlotMachine: () => _onAdd(context),
            ),
          ),
        ),
      ),
      floatingActionButton: BlocProvider<AddSlotMachineDialogBloc>(
        create: (_) => di(),
        child: FloatingActionButton(
          onPressed: () => _onAdd(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<void> _onAdd(BuildContext context) async {
    showDialog<bool>(
      context: context,
      builder: (_) => const AddSlotMachineDialog(),
    );
  }
}
