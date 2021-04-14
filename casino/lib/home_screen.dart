import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            child: SlotMachineList(),
          ),
        ),
      ),
    );
  }
}
