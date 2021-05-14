import 'package:flutter/material.dart';

import 'game.dart';
import 'name.dart';
import 'settings_button.dart';
import 'token_count.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TokenCount(),
                SettingsButton(),
              ],
            ),
            const Expanded(
              child: FractionallySizedBox(
                heightFactor: 1 / 2,
                child: FittedBox(
                  child: Game(),
                ),
              ),
            ),
            const Name(),
          ],
        ),
      ),
    );
  }
}
