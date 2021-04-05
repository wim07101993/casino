import 'package:flutter/material.dart';

import 'number_controller.dart';

class Number extends StatefulWidget {
  const Number({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final NumberController controller;

  @override
  _NumberState createState() => _NumberState();
}

class _NumberState extends State<Number> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onValueChanged);
  }

  @override
  void didUpdateWidget(covariant Number oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(onValueChanged);
      widget.controller.addListener(onValueChanged);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline1;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 100,
        child: Center(
          child: Text(
            widget.controller.value.toString(),
            style: textStyle,
          ),
        ),
      ),
    );
  }

  void onValueChanged() {
    setState(() {});
  }
}
