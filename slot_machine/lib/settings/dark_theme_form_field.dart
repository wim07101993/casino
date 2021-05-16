import 'package:flutter/material.dart';

import 'switch_form_field.dart';

class DarkThemeFormField extends StatelessWidget {
  const DarkThemeFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SwitchController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Enable dark mode'),
        SwitchFormField(controller: controller),
      ],
    );
  }
}
