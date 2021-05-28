import 'package:flutter/painting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'box_entry.dart';
import 'converting_box_entry.dart';

part 'theme_box.freezed.dart';

@freezed
class ThemeType with _$ThemeType {
  const factory ThemeType.numbers() = _Numbers;
  const factory ThemeType.classic() = _Classic;
  const factory ThemeType.emoji() = _Emoji;
  const factory ThemeType.programming() = _Programming;
}

class ThemeBox {
  ThemeBox({
    required HiveInterface hive,
  }) : _box = hive.openBox('theme');

  final Future<Box> _box;

  late final BoxEntry<Color> primaryColor = ConvertingBoxEntry(
    box: _box,
    key: 'primary-color',
    defaultValue: const Color(0xFF304FFE),
    toutToTin: colorToInt,
    tinToTout: intToColor,
    saveDelay: 800,
  );

  late final BoxEntry<Color> secondaryColor = ConvertingBoxEntry(
    box: _box,
    key: 'secondary-color',
    defaultValue: const Color(0xFFC51162),
    toutToTin: colorToInt,
    tinToTout: intToColor,
    saveDelay: 800,
  );

  late final BoxEntry<bool> isDarkModeEnabled = BoxEntry(
    box: _box,
    key: 'is-dark-mode-enabled',
    defaultValue: false,
  );

  late final BoxEntry<ThemeType> themeType =
      ConvertingBoxEntry<String, ThemeType>(
    box: _box,
    key: 'theme',
    defaultValue: const ThemeType.numbers(),
    tinToTout: (s) {
      switch (s) {
        case 'numbers':
          return const ThemeType.numbers();
        case 'emoji':
          return const ThemeType.emoji();
        case 'programming':
          return const ThemeType.programming();
        case 'classics':
        default:
          return const ThemeType.classic();
      }
    },
    toutToTin: (t) => t.when(
      numbers: () => 'numbers',
      classic: () => 'classic',
      emoji: () => 'emoji',
      programming: () => 'programming',
    ),
  );

  Stream<BoxEvent> get changes async* {
    final box = await _box;
    yield* box.watch().map((e) => e);
  }
}
