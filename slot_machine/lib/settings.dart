import 'package:casino_shared/casino_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/settings_bloc.dart';
import 'main.dart';
import 'settings/api_uri_form_field.dart';
import 'settings/application_color_form_field.dart';
import 'settings/dark_theme_form_field.dart';
import 'settings/name_form_field.dart';

class Settings extends StatefulWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: BlocBuilderListener<SettingsBloc, SettingsState>(
        create: (_) => di(),
        listener: _onStateChanged,
        builder: (context, state) => Form(
          key: _formKey,
          child: Column(children: [
            ApiUriFormField(controller: state.apiUrl),
            const SizedBox(height: 16),
            NameFormField(controller: state.name),
            const SizedBox(height: 24),
            ApplicationColorFormField(controller: state.applicationColor),
            const SizedBox(height: 24),
            DarkThemeFormField(controller: state.isDarkModeEnabled),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _saveButton(context),
                const SizedBox(width: 16),
                _cancelButton(context),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget _saveButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (_formKey.currentState?.validate() != true) {
          return;
        }
        BlocProvider.of<SettingsBloc>(context).add(const SettingsEvent.save());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text('Save', style: Theme.of(context).textTheme.button),
      ),
    );
  }

  Widget _cancelButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.maybePop(context, false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text('Cancel', style: Theme.of(context).textTheme.button),
      ),
    );
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
