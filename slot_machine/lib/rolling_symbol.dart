import 'package:flutter/material.dart';

import 'symbol_controller.dart';

class RollingSymbol extends StatefulWidget {
  const RollingSymbol({
    Key? key,
    required this.controller,
    required this.symbols,
  }) : super(key: key);

  final SymbolController controller;
  final List<Widget> symbols;

  @override
  _RollingSymbolState createState() => _RollingSymbolState();
}

class _RollingSymbolState extends State<RollingSymbol> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onValueChanged);
  }

  @override
  void didUpdateWidget(covariant RollingSymbol oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(onValueChanged);
      widget.controller.addListener(onValueChanged);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 100,
        height: 100,
        child: widget.symbols[widget.controller.value],
      ),
    );
  }

  void onValueChanged() {
    setState(() {});
  }
}
