import 'package:flutter/material.dart';

import 'switch_form_field.dart';

class BoolFormField extends StatelessWidget {
  const BoolFormField({Key? key, required this.controller, required this.label})
      : super(key: key);

  final SwitchController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: theme.textTheme.subtitle1),
        SwitchFormField(controller: controller),
      ],
    );
  }
}
