import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../domain/controller.dart';

class SwitchFormField extends StatelessWidget {
  const SwitchFormField({Key? key, required this.controller}) : super(key: key);

  final SwitchController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller,
      builder: (context, value, _) => Switch(
        activeColor: Theme.of(context).primaryColor,
        onChanged: (b) => controller.value = b,
        value: value,
      ),
    );
  }
}

class SwitchController extends Controller<bool> {
  SwitchController({bool value = false}) : super(value: value);
}
