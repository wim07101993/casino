import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bloc/settings_bloc.dart';
import 'main.dart';
import 'settings/application_settings_form.dart';
import 'settings/theme_settings_form.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: BlocBuilderListener<SettingsBloc, SettingsState>(
        create: (_) => di(),
        listener: _onStateChanged,
        builder: _builder,
      ),
    );
  }

  Widget _builder(BuildContext context, SettingsState state) {
    final theme = Theme.of(context);
    return Column(children: [
      ApplicationSettingsForm(
        apiUrl: state.apiUrl,
        name: state.name,
      ),
      const SizedBox(height: 16),
      ThemeSettingsForm(
        primaryColor: state.primaryColor,
        secondaryColor: state.secondaryColor,
        isDarkModeEnabled: state.isDarkModeEnabled,
        themeType: state.selectedThemeType,
      ),
    ]);
  }

  void _onStateChanged(BuildContext context, SettingsState state) {
    final error = state.error;
    if (error != null) {
      showError(context, error);
    }
    if (state.hasSaved) {
      Navigator.maybePop(context, true);
    }
  }
}
