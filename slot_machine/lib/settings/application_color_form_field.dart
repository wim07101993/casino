import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ApplicationColorFormField extends StatefulWidget {
  const ApplicationColorFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ColorPickerController controller;

  @override
  _ApplicationColorFormFieldState createState() =>
      _ApplicationColorFormFieldState();
}

class _ApplicationColorFormFieldState extends State<ApplicationColorFormField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onColorChanged);
  }

  @override
  void didUpdateWidget(covariant ApplicationColorFormField oldWidget) {
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
        const Text('Application color'),
        const SizedBox(height: 16),
        ColorPicker(
          pickerColor: widget.controller.value,
          onColorChanged: widget.controller.setValue,
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

  void setValue(Color color) {
    _color = color;
    _invokeListeners();
  }

  @override
  void addListener(VoidCallback listener) => _listeners.add(listener);

  @override
  void removeListener(VoidCallback listener) => _listeners.remove(listener);

  void _invokeListeners() => _listeners.forEach((c) => c());

  void dispose() => _listeners.clear();
}
