import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorFormField extends StatefulWidget {
  const ColorFormField({
    Key? key,
    this.label,
    required this.controller,
  }) : super(key: key);

  final Widget? label;
  final ColorPickerController controller;

  @override
  _ColorFormFieldState createState() => _ColorFormFieldState();
}

class _ColorFormFieldState extends State<ColorFormField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onColorChanged);
  }

  @override
  void didUpdateWidget(covariant ColorFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.controller.removeListener(_onColorChanged);
    widget.controller.addListener(_onColorChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_onColorChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) widget.label!,
        const SizedBox(height: 16),
        ColorPicker(
          pickerColor: widget.controller.value,
          onColorChanged: (c) => widget.controller.value = c.withAlpha(0xFF),
          enableAlpha: false,
        ),
      ],
    );
  }

  void _onColorChanged() {
    setState(() {});
  }
}

class ColorPickerController extends ValueListenable<Color> {
  ColorPickerController({
    Color color = Colors.black,
  }) : _color = color;

  final List<VoidCallback> _listeners = [];
  Color _color;

  @override
  Color get value => _color;
  set value(Color value) {
    _color = value;
    _invokeListeners();
  }

  @override
  void addListener(VoidCallback listener) => _listeners.add(listener);

  @override
  void removeListener(VoidCallback listener) => _listeners.remove(listener);

  void _invokeListeners() => _listeners.forEach((c) => c());

  void dispose() => _listeners.clear();
}
