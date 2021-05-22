import 'package:flutter/material.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name', style: theme.textTheme.subtitle1),
        TextFormField(
          controller: controller,
          validator: _validate,
          decoration: const InputDecoration(
            hintText: 'e.g.: My first slot-machine',
          ),
        ),
      ],
    );
  }

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }
}
