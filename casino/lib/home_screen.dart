import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'add_slot_machine_dialog.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onAdd(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _onAdd(BuildContext context) async {
    final controller = TextEditingController();
    final isOk = await showDialog<bool>(
      context: context,
      builder: (context) => AddSlotMachineDialog(controller: controller),
    );
    if (isOk != true) {
      return;
    }
    try {
      await di<CasinoApi>().addSlotMachine(controller.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString().trim()),
      ));
    }
  }
}
