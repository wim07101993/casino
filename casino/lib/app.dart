import 'package:flutter/material.dart';

import 'home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Casino",
      home: HomeScreen(),
    );
  }
}
