import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/settings_bloc.dart';
import 'api_uri_form_field.dart';
import 'name_form_field.dart';

class ApplicationSettingsForm extends StatefulWidget {
  const ApplicationSettingsForm({
    Key? key,
    required this.apiUrl,
    required this.name,
  }) : super(key: key);

  final TextEditingController apiUrl;
  final TextEditingController name;

  @override
  _ApplicationSettingsFormState createState() =>
      _ApplicationSettingsFormState();
}

class _ApplicationSettingsFormState extends State<ApplicationSettingsForm> {
  final _applicationSettingsForMKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Form(
          key: _applicationSettingsForMKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Application Settings', style: theme.textTheme.headline6),
              ApiUriFormField(controller: widget.apiUrl),
              const SizedBox(height: 16),
              NameFormField(controller: widget.name),
              const SizedBox(height: 24),
              Container(
                alignment: Alignment.centerRight,
                child: _saveButton(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _saveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_applicationSettingsForMKey.currentState?.validate() != true) {
          return;
        }
        BlocProvider.of<SettingsBloc>(context)
            .add(const SettingsEvent.saveApplicationSettings());
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).buttonColor),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text('Save'),
      ),
    );
  }
}
