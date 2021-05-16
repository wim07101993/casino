import 'package:flutter/material.dart';

import 'settings.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () => _showSettings(context),
    );
  }

  Future<void> _showSettings(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Settings'),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).maybePop(false),
              ),
            ],
          ),
          children: const [Settings()],
        );
      },
    );
  }
}
