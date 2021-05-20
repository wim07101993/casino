import 'package:flutter/material.dart';

class Number extends StatelessWidget {
  const Number({
    Key? key,
    required this.value,
  }) : super(key: key);

  final int value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FittedBox(
      child: Text(
        value.toString(),
        style: TextStyle(
          color: getColor(theme.primaryColor),
          fontFamily: theme.textTheme.headline1?.fontFamily,
        ),
      ),
    );
  }

  Color getColor(Color baseColor) {
    final baseHsl = HSLColor.fromColor(baseColor);
    var hue = baseHsl.hue + 360 / 7 * value;
    if (hue > 360) {
      hue -= 360;
    }
    return baseHsl.withHue(hue).toColor();
  }
}
