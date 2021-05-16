import 'package:flutter/material.dart';

import 'color_form_field.dart';
import 'dark_theme_form_field.dart';
import 'switch_form_field.dart';

class ThemeSettingsForm extends StatelessWidget {
  const ThemeSettingsForm({
    Key? key,
    required this.primaryColor,
    required this.isDarkModeEnabled,
  }) : super(key: key);

  final ColorPickerController primaryColor;
  final SwitchController isDarkModeEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorFormField(
          controller: primaryColor,
          label: const Text('Primary color'),
        ),
        const SizedBox(height: 24),
        DarkThemeFormField(controller: isDarkModeEnabled),
      ],
    );
  }
}
