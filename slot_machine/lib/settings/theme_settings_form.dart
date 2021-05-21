import 'package:flutter/material.dart';

import 'color_form_field.dart';
import 'dark_theme_form_field.dart';
import 'switch_form_field.dart';
import 'theme_selector_form_field.dart';

class ThemeSettingsForm extends StatelessWidget {
  const ThemeSettingsForm({
    Key? key,
    required this.primaryColor,
    required this.isDarkModeEnabled,
    required this.themeType,
  }) : super(key: key);

  final ColorPickerController primaryColor;
  final SwitchController isDarkModeEnabled;
  final ThemeSelectorController themeType;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ThemeSelectorFormField(controller: themeType),
      const SizedBox(height: 16),
      ColorFormField(
        controller: primaryColor,
        label: const Text('Primary color'),
      ),
      const SizedBox(height: 16),
      DarkThemeFormField(controller: isDarkModeEnabled),
    ]);
  }
}
