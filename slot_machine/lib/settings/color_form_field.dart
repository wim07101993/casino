import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

import '../domain/controller.dart';

class ColorFormField extends StatelessWidget {
  const ColorFormField({
    Key? key,
    this.label,
    required this.controller,
  }) : super(key: key);

  final Widget? label;
  final CircleColorPickerController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) label!,
        const SizedBox(height: 16),
        // ValueListenableBuilder<Color>(
        // valueListenable: controller,
        // builder: (context, value, _) => CircleColorPicker(
        CircleColorPicker(
          controller: controller,
          onChanged: (c) => controller.color = c.withAlpha(0xFF),
          // enableAlpha: false,
          // ),
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
