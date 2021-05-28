import 'package:flutter/material.dart';

abstract class AppThemeData {
  const AppThemeData({
    required this.name,
    required this.symbols,
    required this.themeData,
    this.background,
    this.overlay,
  });

  final String name;
  final List<Widget> symbols;
  final Widget? background;
  final Widget? overlay;
  final ThemeData themeData;
}
