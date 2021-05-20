import 'package:flutter/material.dart';

abstract class AppThemeData {
  const AppThemeData({
    required this.name,
    required this.symbols,
    required this.backgroundImage,
    required this.themeData,
  });

  final String name;
  final List<Widget> symbols;
  final ImageProvider? backgroundImage;
  final ThemeData themeData;
}
