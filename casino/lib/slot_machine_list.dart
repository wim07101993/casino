import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

import 'data/casino_api.dart' show CasinoApi, SlotMachine;
import 'main.dart';
import 'slot_machine_controls.dart';

class SlotMachineList extends StatefulWidget {
  const SlotMachineList({
    Key? key,
    required this.onAddSlotMachine,
  }) : super(key: key);

  final VoidCallback onAddSlotMachine;

  @override
  _SlotMachineListState createState() => _SlotMachineListState();
}

class _SlotMachineListState extends State<SlotMachineList> {
  final CasinoApi api = di();

  bool isDisposed = false;
  List<SlotMachine>? slotMachines;
  Object? error;

  @override
  void initState() {
    super.initState();
    pollForChanges();
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (slotMachines == null) {
      if (error != null) {
        return _error(error!);
      } else {
        return const CircularProgressIndicator();
      }
    } else if (slotMachines!.isEmpty) {
      return _empty();
    } else {
      return _list(slotMachines!);
    }
  }

  Widget _error(Object error) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LayoutBuilder(builder: (context, constraints) {
          const double maxSize = 100;
          final size = min(constraints.biggest.shortestSide, maxSize);
          return Center(
            child: Icon(Icons.warning_outlined, size: size),
          );
        }),
        const Text('Something went wrong while fetching the slot-machines'),
      ],
    );
  }

  Widget _list(List<SlotMachine> slotMachines) {
    return ListView.separated(
      itemCount: slotMachines.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, i) {
        final slotMachine = slotMachines[i];
        return ListTile(
          key: Key(slotMachine.id),
          title: Text(slotMachine.name),
          trailing: SlotMachineControls(
            slotMachine: slotMachine,
          ),
        );
      },
    );
  }

  Widget _empty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
            'There are no slot-machines registered yet. Click on the button to add one.'),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: widget.onAddSlotMachine,
          child: const Text('Add slot-machine'),
        ),
      ],
    );
  }

  Future pollForChanges() async {
    while (!isDisposed) {
      try {
        final items = await api
            .listSlotMachines()
            .then((x) => x..sort((a, b) => a.name.compareTo(b.name)));
        setState(() => slotMachines = items);
      } catch (e) {
        di<Logger>().e(e);
        setState(() => error = e);
      }
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }
}
