import 'package:flutter/material.dart';

import 'home_screen.dart';

class SlotMachine extends StatelessWidget {
  const SlotMachine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot-machine',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
