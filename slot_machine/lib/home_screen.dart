import 'package:flutter/material.dart';

import 'game.dart';
import 'name.dart';
import 'token_count.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Name(),
                TokenCount(),
              ],
            ),
          ),
          const Expanded(child: Game()),
          Container(color: Colors.blue),
        ],
      ),
    );
  }
}
