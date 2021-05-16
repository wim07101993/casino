import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SwitchFormField extends StatefulWidget {
  const SwitchFormField({Key? key, required this.controller}) : super(key: key);

  final SwitchController controller;

  @override
  _SwitchFormFieldState createState() => _SwitchFormFieldState();
}

class _SwitchFormFieldState extends State<SwitchFormField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onValueChanged);
  }

  @override
  void didUpdateWidget(covariant SwitchFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.controller.removeListener(_onValueChanged);
    widget.controller.addListener(_onValueChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_onValueChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Theme.of(context).primaryColor,
      onChanged: (b) => widget.controller.value = b,
      value: widget.controller.value,
    );
  }

  void _onValueChanged() => setState(() {});
}

class SwitchController extends ValueListenable<bool> {
  SwitchController({
    bool value = false,
  }) : _value = value;

  final List<VoidCallback> _listeners = [];
  bool _value;

  @override
  bool get value => _value;
  set value(bool value) {
    _value = value;
    _invokeListeners();
  }

  @override
  void addListener(VoidCallback listener) => _listeners.add(listener);
  @override
  void removeListener(VoidCallback listener) => _listeners.remove(listener);

  void _invokeListeners() => _listeners.forEach((l) => l());
}
