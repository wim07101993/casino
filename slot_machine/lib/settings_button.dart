import 'package:flutter/material.dart';

import 'settings.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        if (MediaQuery.of(context).size.width < 800) {
          _showSettingsPage(context);
        } else {
          _showSettingsDialog(context);
        }
      },
    );
  }

  Future<void> _showSettingsDialog(BuildContext context) {
    return showDialog(
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

  Future<void> _showSettingsPage(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Settings'),
              floating: true,
            ),
            SliverList(delegate: SliverChildListDelegate([const Settings()]))
          ],
        ),
      );
    }));
  }
}
