import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slot_machine/domain/themes/programming_theme.dart';

import '../domain/controller.dart';
import '../domain/local_db/theme_box.dart';
import '../domain/themes/classic_theme.dart';
import '../domain/themes/emoji_theme.dart';
import '../domain/themes/number_theme.dart';

class ThemeSelectorFormField extends StatelessWidget {
  const ThemeSelectorFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ThemeSelectorController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeType>(
      valueListenable: controller,
      builder: (context, value, _) {
        return Row(children: [
          GestureDetector(
            onTap: () => controller.value = const ThemeType.numbers(),
            child: ThemeTypeBox(
              isSelected: value == const ThemeType.numbers(),
              child: const FittedBox(child: Number(value: NumberValue.seven())),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => controller.value = const ThemeType.classic(),
            child: ThemeTypeBox(
              isSelected: value == const ThemeType.classic(),
              child: const ClassicSymbol(value: ClassicSymbolValue.cherry()),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => controller.value = const ThemeType.emoji(),
            child: ThemeTypeBox(
              isSelected: value == const ThemeType.emoji(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Emoji(value: EmojiValue.poop()),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => controller.value = const ThemeType.programming(),
            child: ThemeTypeBox(
              isSelected: value == const ThemeType.programming(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: ProgrammingSymbol(value: ProgrammingSymbolValue.html()),
              ),
            ),
          ),
        ]);
      },
    );
  }
}

class ThemeSelectorController extends Controller<ThemeType> {
  ThemeSelectorController({
    ThemeType value = const ThemeType.numbers(),
  }) : super(value: value);
}

class ThemeTypeBox extends StatelessWidget {
  const ThemeTypeBox({
    Key? key,
    required this.isSelected,
    required this.child,
  }) : super(key: key);

  final bool isSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      elevation: 2,
      child: Container(
        width: 50,
        height: 50,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            side: BorderSide(
              color: isSelected ? theme.accentColor : Colors.grey,
              width: 4,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
