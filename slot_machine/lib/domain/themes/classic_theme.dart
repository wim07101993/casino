import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme_data.dart';

part 'classic_theme.freezed.dart';

class ClassicTheme extends AppThemeData {
  ClassicTheme({ThemeData? baseTheme})
      : super(
          name: 'classic',
          themeData: getThemeData(baseTheme ?? ThemeData.light()),
          symbols: const [
            ClassicSymbol(value: ClassicSymbolValue.cherry()),
            ClassicSymbol(value: ClassicSymbolValue.grapes()),
            ClassicSymbol(value: ClassicSymbolValue.strawberry()),
            ClassicSymbol(value: ClassicSymbolValue.bell()),
            ClassicSymbol(value: ClassicSymbolValue.lemon()),
            ClassicSymbol(value: ClassicSymbolValue.melon()),
            ClassicSymbol(value: ClassicSymbolValue.seven()),
          ],
        );

  static ThemeData getThemeData(ThemeData baseTheme) {
    final monotonTextTheme = GoogleFonts.monotonTextTheme();
    final monoton = GoogleFonts.monoton();
    final montserratTextTheme = GoogleFonts.montserratTextTheme();
    final montserrat = GoogleFonts.montserrat();
    final headLineFont = monoton.fontFamily;
    final otherFont = montserrat.fontFamily;
    final baseTextTheme = baseTheme.textTheme;
    return baseTheme.copyWith(
      textTheme: baseTheme.textTheme.copyWith(
        headline1:
            baseTextTheme.headline1?.copyWith(fontFamily: headLineFont) ??
                monotonTextTheme.headline1,
        headline2:
            baseTextTheme.headline2?.copyWith(fontFamily: headLineFont) ??
                monotonTextTheme.headline2,
        headline3:
            baseTextTheme.headline3?.copyWith(fontFamily: headLineFont) ??
                monotonTextTheme.headline3,
        headline4:
            baseTextTheme.headline4?.copyWith(fontFamily: headLineFont) ??
                monotonTextTheme.headline4,
        headline5:
            baseTextTheme.headline5?.copyWith(fontFamily: headLineFont) ??
                monotonTextTheme.headline5,
        headline6:
            baseTextTheme.headline6?.copyWith(fontFamily: headLineFont) ??
                monotonTextTheme.headline6,
        bodyText1: baseTextTheme.bodyText1?.copyWith(fontFamily: otherFont) ??
            montserratTextTheme.bodyText1,
        bodyText2: baseTextTheme.bodyText2?.copyWith(fontFamily: otherFont) ??
            montserratTextTheme.bodyText2,
        button: baseTextTheme.button?.copyWith(fontFamily: otherFont) ??
            montserratTextTheme.button,
        caption: baseTextTheme.caption?.copyWith(fontFamily: otherFont) ??
            montserratTextTheme.caption,
        overline: baseTextTheme.overline?.copyWith(fontFamily: otherFont) ??
            montserratTextTheme.overline,
        subtitle1: baseTextTheme.subtitle1?.copyWith(fontFamily: otherFont) ??
            montserratTextTheme.subtitle1,
        subtitle2: baseTextTheme.subtitle2?.copyWith(fontFamily: otherFont) ??
            montserratTextTheme.subtitle2,
      ),
    );
  }
}

@freezed
class ClassicSymbolValue with _$ClassicSymbolValue {
  const ClassicSymbolValue._();
  const factory ClassicSymbolValue.cherry() = _Cherry;
  const factory ClassicSymbolValue.grapes() = _Grapes;
  const factory ClassicSymbolValue.strawberry() = _Strawberry;
  const factory ClassicSymbolValue.bell() = _Bell;
  const factory ClassicSymbolValue.lemon() = _Lemon;
  const factory ClassicSymbolValue.melon() = _Melon;
  const factory ClassicSymbolValue.seven() = _Seven;

  String get asset {
    return when(
      cherry: () => 'assets/classic/cherry.png',
      grapes: () => 'assets/classic/grapes.png',
      strawberry: () => 'assets/classic/strawberry.png',
      bell: () => 'assets/classic/bell.png',
      lemon: () => 'assets/classic/lemon.png',
      melon: () => 'assets/classic/melon.png',
      seven: () => 'assets/classic/seven.png',
    );
  }
}

class ClassicSymbol extends StatelessWidget {
  const ClassicSymbol({
    Key? key,
    required this.value,
  }) : super(key: key);

  final ClassicSymbolValue value;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Image.asset(value.asset),
    );
  }
}
