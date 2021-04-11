import 'package:flutter/material.dart';

import 'home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Slot-machine controller',
      home: HomeScreen(),
    );
  }
}
