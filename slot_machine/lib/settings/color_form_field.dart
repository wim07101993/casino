import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../domain/controller.dart';

class ColorFormField extends StatelessWidget {
  const ColorFormField({
    Key? key,
    this.label,
    required this.controller,
  }) : super(key: key);

  final Widget? label;
  final ColorPickerController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) label!,
        const SizedBox(height: 16),
        ValueListenableBuilder<Color>(
          valueListenable: controller,
          builder: (context, value, _) => ColorPicker(
            pickerColor: value,
            onColorChanged: (c) => controller.value = c.withAlpha(0xFF),
            enableAlpha: false,
          ),
        ),
      ],
    );
  }
}

class ColorPickerController extends Controller<Color> {
  ColorPickerController({
    Color color = Colors.black,
  }) : super(value: color);
}
