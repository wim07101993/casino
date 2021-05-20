import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme_data.dart';
import 'number.dart';

class NumberTheme extends AppThemeData {
  NumberTheme({ThemeData? baseTheme})
      : super(
          name: 'classic',
          backgroundImage: null,
          themeData: getThemeData(baseTheme ?? ThemeData.light()),
          symbols: const [
            Number(value: 1),
            Number(value: 2),
            Number(value: 3),
            Number(value: 4),
            Number(value: 5),
            Number(value: 6),
            Number(value: 7),
          ],
        );

  static ThemeData getThemeData(ThemeData baseTheme) {
    return baseTheme.copyWith(
      textTheme: baseTheme.textTheme.copyWith(
        headline1: baseTheme.textTheme.headline1?.copyWith(
          fontFamily: GoogleFonts.goblinOne().fontFamily,
        ),
        headline2: baseTheme.textTheme.headline2?.copyWith(
          fontFamily: GoogleFonts.goblinOne().fontFamily,
        ),
        headline3: baseTheme.textTheme.headline3?.copyWith(
          fontFamily: GoogleFonts.goblinOne().fontFamily,
        ),
        headline4: baseTheme.textTheme.headline4?.copyWith(
          fontFamily: GoogleFonts.goblinOne().fontFamily,
        ),
        headline5: baseTheme.textTheme.headline5?.copyWith(
          fontFamily: GoogleFonts.goblinOne().fontFamily,
        ),
        headline6: baseTheme.textTheme.headline6?.copyWith(
          fontFamily: GoogleFonts.goblinOne().fontFamily,
        ),
        bodyText1: baseTheme.textTheme.bodyText1?.copyWith(
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
        bodyText2: baseTheme.textTheme.bodyText2?.copyWith(
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
        button: baseTheme.textTheme.button?.copyWith(
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
        caption: baseTheme.textTheme.caption?.copyWith(
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
        overline: baseTheme.textTheme.overline?.copyWith(
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
        subtitle1: baseTheme.textTheme.subtitle1?.copyWith(
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
        subtitle2: baseTheme.textTheme.subtitle2?.copyWith(
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      ),
    );
  }
}
