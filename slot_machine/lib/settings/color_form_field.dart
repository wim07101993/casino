import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

import '../domain/controller.dart';

class ColorFormField extends StatefulWidget {
  const ColorFormField({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  final String label;
  final CircleColorPickerController controller;

  @override
  _ColorFormFieldState createState() => _ColorFormFieldState();
}

class _ColorFormFieldState extends State<ColorFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.subtitle1),
        const SizedBox(height: 16),
        CircleColorPicker(
          controller: widget.controller,
          onChanged: (c) {
            setState(() => widget.controller.color = c.withAlpha(0xFF));
          },
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
