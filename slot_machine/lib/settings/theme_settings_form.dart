import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

import 'bool_form_field.dart';
import 'color_form_field.dart';
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

  final CircleColorPickerController primaryColor;
  final CircleColorPickerController secondaryColor;
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
        BoolFormField(controller: isDarkModeEnabled, label: 'Dark mode'),
        const SizedBox(height: 16),
        Wrap(children: [
          ColorFormField(controller: primaryColor, label: 'Primary color'),
          const SizedBox(height: 16),
          ColorFormField(controller: secondaryColor, label: 'Secondary color'),
        ]),
      ],
    );
  }
}
