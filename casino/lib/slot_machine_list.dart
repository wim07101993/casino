import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/slot_machine_list_bloc.dart';
import 'main.dart';
import 'models/models.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<SlotMachineListBloc>(),
      child: BlocBuilder<SlotMachineListBloc, SlotMachineListState>(
        builder: (context, state) {
          print('SLOT_MACHINE_LIST BUILD $state');
          if (state.isLoading) {
            return const CircularProgressIndicator();
          } else if (state.slotMachines.isEmpty) {
            return state.error != null ? _error(state.error!) : _empty();
          } else {
            return _list(state.slotMachines);
          }
        },
      ),
    );
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
            id: slotMachine.id,
            name: slotMachine.name,
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
}
