import 'package:flutter/material.dart';

import 'color_form_field.dart';
import 'dark_theme_form_field.dart';
import 'switch_form_field.dart';
import 'theme_selector_form_field.dart';

class ThemeSettingsForm extends StatelessWidget {
  const ThemeSettingsForm({
    Key? key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.isDarkModeEnabled,
    required this.themeType,
  }) : super(key: key);

  final ColorPickerController primaryColor;
  final ColorPickerController secondaryColor;
  final SwitchController isDarkModeEnabled;
  final ThemeSelectorController themeType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Theme settings', style: theme.textTheme.headline6),
        const SizedBox(height: 8),
        ThemeSelectorFormField(controller: themeType),
        const SizedBox(height: 16),
        DarkThemeFormField(controller: isDarkModeEnabled),
        const SizedBox(height: 16),
        ColorFormField(
          controller: primaryColor,
          label: Text('Primary color', style: theme.textTheme.subtitle1),
        ),
        const SizedBox(height: 16),
        ColorFormField(
          controller: secondaryColor,
          label: Text('Secondary color', style: theme.textTheme.subtitle1),
        ),
      ],
    );
  }
}
