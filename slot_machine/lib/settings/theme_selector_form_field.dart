import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../domain/controller.dart';
import '../domain/local_db/theme_box.dart';

class ThemeSelectorFormField extends StatelessWidget {
  const ThemeSelectorFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SymbolSelectorController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeType>(
      valueListenable: controller,
      builder: (context, value, _) => ListView(),
    );
  }
}

class SymbolSelectorController extends Controller<ThemeType> {
  SymbolSelectorController({
    ThemeType value = const ThemeType.numbers(),
  }) : super(value: value);
}
