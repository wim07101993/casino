import 'package:flutter/material.dart';

class ApiUriFormField extends StatelessWidget {
  const ApiUriFormField({
    Key? key,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _validate,
      decoration: const InputDecoration(
        labelText: 'API-url',
      ),
    );
  }

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL cannot be empty';
    }
    final uri = Uri.tryParse(value);
    if (uri == null) {
      return 'Please enter a valid url';
    }
    return null;
  }
}
