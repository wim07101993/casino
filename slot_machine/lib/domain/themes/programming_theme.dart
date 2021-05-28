import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme_data.dart';

part 'programming_theme.freezed.dart';

class ProgrammingTheme extends AppThemeData {
  ProgrammingTheme({ThemeData? baseTheme})
      : super(
          name: 'numbers',
          background: const Image(
            image: AssetImage('assets/programming/background.png'),
            fit: BoxFit.fill,
          ),
          themeData: getThemeData(baseTheme ?? ThemeData.light()),
          symbols: const [
            ProgrammingSymbol(value: ProgrammingSymbolValue.ifStatement()),
            ProgrammingSymbol(value: ProgrammingSymbolValue.braces()),
            ProgrammingSymbol(value: ProgrammingSymbolValue.html()),
            ProgrammingSymbol(value: ProgrammingSymbolValue.cPlusPlus()),
            ProgrammingSymbol(value: ProgrammingSymbolValue.quotes()),
            ProgrammingSymbol(value: ProgrammingSymbolValue.dollarSign()),
            ProgrammingSymbol(value: ProgrammingSymbolValue.ampersand()),
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
class ProgrammingSymbolValue with _$ProgrammingSymbolValue {
  const ProgrammingSymbolValue._();
  const factory ProgrammingSymbolValue.ifStatement() = _IfStatement;
  const factory ProgrammingSymbolValue.braces() = _Braces;
  const factory ProgrammingSymbolValue.html() = _Html;
  const factory ProgrammingSymbolValue.cPlusPlus() = _CPlusPlus;
  const factory ProgrammingSymbolValue.quotes() = _Quotes;
  const factory ProgrammingSymbolValue.dollarSign() = _DollarSign;
  const factory ProgrammingSymbolValue.ampersand() = _Ampersand;

  int get toInt {
    return when(
      ifStatement: () => 1,
      braces: () => 2,
      html: () => 3,
      cPlusPlus: () => 4,
      quotes: () => 5,
      dollarSign: () => 6,
      ampersand: () => 7,
    );
  }

  @override
  String toString() {
    return when(
      ifStatement: () => 'if',
      braces: () => '{}',
      html: () => '</>',
      cPlusPlus: () => 'c++',
      quotes: () => '"',
      dollarSign: () => '\$',
      ampersand: () => '&',
    );
  }
}

class ProgrammingSymbol extends StatelessWidget {
  const ProgrammingSymbol({
    Key? key,
    required this.value,
  }) : super(key: key);

  final ProgrammingSymbolValue value;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: FittedBox(
        child: Text(
          value.toString(),
          style: GoogleFonts.vt323TextTheme()
              .headline1!
              .copyWith(color: const Color(0xFF00FF00)),
        ),
      ),
    );
  }
}
