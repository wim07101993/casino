import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slot_machine/settings/api_uri_form_field.dart';
import 'package:slot_machine/settings/name_form_field.dart';

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
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
      child: Form(
        key: _formKey,
        child: Column(
          children: const [
            ApiUriFormField(),
            SizedBox(height: 16),
            NameFormField(),
          ],
        ),
      ),
    );
  }

  String? _validateApiUri(String? value) {}
}
