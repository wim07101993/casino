import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme_data.dart';

part 'number_theme.freezed.dart';

class NumberTheme extends AppThemeData {
  NumberTheme({ThemeData? baseTheme})
      : super(
          name: 'numbers',
          backgroundImage: null,
          themeData: getThemeData(baseTheme ?? ThemeData.light()),
          symbols: const [
            Number(value: NumberValue.one()),
            Number(value: NumberValue.two()),
            Number(value: NumberValue.three()),
            Number(value: NumberValue.four()),
            Number(value: NumberValue.five()),
            Number(value: NumberValue.six()),
            Number(value: NumberValue.seven()),
          ],
        );

  static ThemeData getThemeData(ThemeData baseTheme) {
    final goblinOneTextTheme = GoogleFonts.goblinOneTextTheme();
    final goblinOne = GoogleFonts.goblinOne();
    final ralewayTextTheme = GoogleFonts.ralewayTextTheme();
    final raleway = GoogleFonts.raleway();
    final headLineFont = goblinOne.fontFamily;
    final otherFont = raleway.fontFamily;
    final baseTextTheme = baseTheme.textTheme;
    return baseTheme.copyWith(
      textTheme: baseTheme.textTheme.copyWith(
        headline1:
            baseTextTheme.headline1?.copyWith(fontFamily: headLineFont) ??
                goblinOneTextTheme.headline1,
        headline2:
            baseTextTheme.headline2?.copyWith(fontFamily: headLineFont) ??
                goblinOneTextTheme.headline2,
        headline3:
            baseTextTheme.headline3?.copyWith(fontFamily: headLineFont) ??
                goblinOneTextTheme.headline3,
        headline4:
            baseTextTheme.headline4?.copyWith(fontFamily: headLineFont) ??
                goblinOneTextTheme.headline4,
        headline5:
            baseTextTheme.headline5?.copyWith(fontFamily: headLineFont) ??
                goblinOneTextTheme.headline5,
        headline6:
            baseTextTheme.headline6?.copyWith(fontFamily: headLineFont) ??
                goblinOneTextTheme.headline6,
        bodyText1: baseTextTheme.bodyText1?.copyWith(fontFamily: otherFont) ??
            ralewayTextTheme.bodyText1,
        bodyText2: baseTextTheme.bodyText2?.copyWith(fontFamily: otherFont) ??
            ralewayTextTheme.bodyText2,
        button: baseTextTheme.button?.copyWith(fontFamily: otherFont) ??
            ralewayTextTheme.button,
        caption: baseTextTheme.caption?.copyWith(fontFamily: otherFont) ??
            ralewayTextTheme.caption,
        overline: baseTextTheme.overline?.copyWith(fontFamily: otherFont) ??
            ralewayTextTheme.overline,
        subtitle1: baseTextTheme.subtitle1?.copyWith(fontFamily: otherFont) ??
            ralewayTextTheme.subtitle1,
        subtitle2: baseTextTheme.subtitle2?.copyWith(fontFamily: otherFont) ??
            ralewayTextTheme.subtitle2,
      ),
    );
  }
}

@freezed
class NumberValue with _$NumberValue {
  const NumberValue._();
  const factory NumberValue.one() = _One;
  const factory NumberValue.two() = _Two;
  const factory NumberValue.three() = _Three;
  const factory NumberValue.four() = _Four;
  const factory NumberValue.five() = _Five;
  const factory NumberValue.six() = _Six;
  const factory NumberValue.seven() = _Seven;

  int get toInt {
    return when(
      one: () => 1,
      two: () => 2,
      three: () => 3,
      four: () => 4,
      five: () => 5,
      six: () => 6,
      seven: () => 7,
    );
  }

  @override
  String toString() {
    return when(
      one: () => '1',
      two: () => '2',
      three: () => '3',
      four: () => '4',
      five: () => '5',
      six: () => '6',
      seven: () => '7',
    );
  }
}

class Number extends StatelessWidget {
  const Number({
    Key? key,
    required this.value,
  }) : super(key: key);

  final NumberValue value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FittedBox(
      child: Text(
        value.toString(),
        style: GoogleFonts.goblinOneTextTheme()
            .headline1!
            .copyWith(color: getColor(theme.primaryColor)),
      ),
    );
  }

  Color getColor(Color baseColor) {
    final baseHsl = HSLColor.fromColor(baseColor);
    var hue = baseHsl.hue + 360 / 7 * value.toInt;
    if (hue > 360) {
      hue -= 360;
    }
    return baseHsl.withHue(hue).toColor();
  }
}
