import 'dart:async';

import 'package:flutter/material.dart';

import 'local_db/theme_box.dart';
import 'themes/app_theme_data.dart';
import 'themes/classic_theme.dart';
import 'themes/emoji_theme.dart';
import 'themes/number_theme.dart';

class AppTheme {
  AppTheme({
    required ThemeBox db,
  }) : _db = db;

  final ThemeBox _db;
  static final AppThemeData defaultTheme = NumberTheme();

  Stream<AppThemeData> get changes => _db.changes.asyncMap((_) => call());

  Future<AppThemeData> call() async {
    var baseTheme =
        await _db.isDarkModeEnabled() ? ThemeData.dark() : ThemeData.light();
    final textTheme = baseTheme.textTheme;
    final primary = await _db.primaryColor();
    final secondary = await _db.secondaryColor();
    baseTheme = baseTheme.copyWith(
      primaryColor: primary,
      accentColor: secondary,
      textTheme: baseTheme.textTheme.copyWith(
        headline1: textTheme.headline1?.copyWith(color: primary),
        headline2: textTheme.headline2?.copyWith(color: primary),
        headline3: textTheme.headline3?.copyWith(color: primary),
        headline4: textTheme.headline4?.copyWith(color: primary),
        headline5: textTheme.headline5?.copyWith(color: primary),
        headline6: textTheme.headline6?.copyWith(color: primary),
        subtitle1: textTheme.subtitle1?.copyWith(color: primary),
        subtitle2: textTheme.subtitle2?.copyWith(color: primary),
        bodyText1: textTheme.bodyText1?.copyWith(color: primary),
        bodyText2: textTheme.bodyText2?.copyWith(color: primary),
        caption: textTheme.caption?.copyWith(color: primary),
        button: textTheme.button?.copyWith(color: primary),
      ),
      buttonColor: primary,
    );
    final type = await _db.themeType();
    return type.when<AppThemeData>(
      numbers: () => NumberTheme(baseTheme: baseTheme),
      classic: () => ClassicTheme(baseTheme: baseTheme),
      emoji: () => EmojiTheme(baseTheme: baseTheme),
    );
  }
}
