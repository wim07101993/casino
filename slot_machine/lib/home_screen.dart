import 'package:flutter/material.dart';

import 'base_widgets/top_safe_area.dart';
import 'game.dart';
import 'name.dart';
import 'settings_button.dart';
import 'token_count.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    this.background,
  }) : super(key: key);

  final Widget? background;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const TopSafeArea(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TokenCount(),
                SettingsButton(),
              ],
            ),
            const Expanded(
              child: FittedBox(child: Game()),
            ),
            const Name(),
          ],
        ),
      ),
    );
  }
}
