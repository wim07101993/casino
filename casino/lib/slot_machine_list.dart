import 'package:casino/slot_machine_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

import 'data/casino_api.dart' show CasinoApi, SlotMachine;
import 'main.dart';

class SlotMachineList extends StatelessWidget {
  SlotMachineList({
    Key? key,
  })  : api = di(),
        super(key: key);

  final CasinoApi api;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.listSlotMachines(),
      builder: (context, AsyncSnapshot<List<SlotMachine>> snapshot) {
        if (snapshot.hasError) {
          return _error(snapshot);
        } else if (snapshot.hasData) {
          return _list(snapshot);
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget _error(AsyncSnapshot<List<SlotMachine>> snapshot) {
    di<Logger>().e(snapshot.error);
    return Column(children: const [
      Icon(Icons.error),
      Text('Something went wrong while fetching the slot-machines'),
    ]);
  }

  Widget _list(AsyncSnapshot<List<SlotMachine>> snapshot) {
    if (snapshot.data == null) {
      return Container();
    }
    return ListView.separated(
      itemCount: snapshot.data!.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, i) {
        final slotMachine = snapshot.data![i];
        return ListTile(
          title: Text(slotMachine.name),
          trailing: SlotMachineControls(
            slotMachine: slotMachine,
          ),
        );
      },
    );
  }
}
