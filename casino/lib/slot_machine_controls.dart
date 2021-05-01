import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/slot_machine_bloc.dart';
import 'bloc/slot_machine_list_bloc.dart';
import 'main.dart';

class SlotMachineControls extends StatefulWidget {
  const SlotMachineControls({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  final String id;
  final String name;

  @override
  _SlotMachineControlsState createState() => _SlotMachineControlsState();
}

class _SlotMachineControlsState extends State<SlotMachineControls> {
  late TextEditingController tokenCountController;
  late SlotMachineBloc bloc;

  @override
  void initState() {
    super.initState();
    tokenCountController = TextEditingController()
      ..addListener(onTokenCountInputChange);
    bloc = SlotMachineBloc(
      setTokenCount: di(),
      getTokenCount: di(),
      logger: di(),
      slotMachinesChanges: di(),
    )..add(SlotMachineEvent.load(widget.id));
  }

  @override
  void didUpdateWidget(covariant SlotMachineControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != oldWidget.id) {
      bloc.add(SlotMachineEvent.load(widget.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<SlotMachineBloc, SlotMachineState>(
        builder: (context, state) {
          if (state.tokens != null) {
            tokenCountController.text = state.tokens.toString();
          }
          return IntrinsicWidth(
            child: Row(children: [
              if (state.error != null) _errorMessage(state.error!),
              _removeTokenButton(context),
              _amountField(),
              _addTokenButton(context),
              _removeButton(context, state),
            ]),
          );
        },
      ),
    );
  }

  Widget _errorMessage(Object error) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Text(
        error.toString(),
        style: TextStyle(color: Theme.of(context).errorColor),
      ),
    );
  }

  Widget _removeTokenButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.remove),
      onPressed: () {
        BlocProvider.of<SlotMachineBloc>(context)
            .add(const SlotMachineEvent.removeToken());
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

  Widget _addTokenButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        BlocProvider.of<SlotMachineBloc>(context)
            .add(const SlotMachineEvent.addToken());
      },
    );
  }

  Widget _removeButton(BuildContext context, SlotMachineState state) {
    return IconButton(
      onPressed: () async {
        if (await _askWhetherUserIsSureToDeleteSlotMachine(context)) {
          BlocProvider.of<SlotMachineListBloc>(context)
              .add(SlotMachineListEvent.removeSlotMachine(id: widget.id));
        }
      },
      color: Theme.of(context).errorColor,
      icon: const Icon(Icons.delete),
    );
  }

  Future<void> onTokenCountInputChange() async {
    final value = int.tryParse(tokenCountController.text);
    if (value != null &&
        bloc.state.tokens != null &&
        value != bloc.state.tokens) {
      bloc.add(SlotMachineEvent.setTokenCount(value));
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
