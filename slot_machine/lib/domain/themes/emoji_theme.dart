import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_theme_data.dart';

part 'emoji_theme.freezed.dart';

class EmojiTheme extends AppThemeData {
  EmojiTheme({ThemeData? baseTheme})
      : super(
          name: 'emoji',
          background: null,
          themeData: getThemeData(baseTheme ?? ThemeData.light()),
          symbols: const [
            Emoji(value: EmojiValue.faceBlowingAKis()),
            Emoji(value: EmojiValue.faceWithTongue()),
            Emoji(value: EmojiValue.flushedFace()),
            Emoji(value: EmojiValue.grimacingFace()),
            Emoji(value: EmojiValue.grinningFace()),
            Emoji(value: EmojiValue.smilingFaceWithSunglasses()),
            Emoji(value: EmojiValue.poop()),
          ],
        );

  static ThemeData getThemeData(ThemeData baseTheme) {
    return baseTheme;
  }
}

@freezed
class EmojiValue with _$EmojiValue {
  const EmojiValue._();
  const factory EmojiValue.faceBlowingAKis() = _FaceBlowingAKis;
  const factory EmojiValue.faceWithTongue() = _FaceWithTongue;
  const factory EmojiValue.flushedFace() = _FlushedFace;
  const factory EmojiValue.grimacingFace() = _GrimacingFace;
  const factory EmojiValue.grinningFace() = _GrinningFace;
  const factory EmojiValue.smilingFaceWithSunglasses() =
      _SmilingFaceWithSunglasses;
  const factory EmojiValue.poop() = _Poop;

  String get asset {
    return when(
      faceBlowingAKis: () => 'assets/emoji/face-blowing-a-kiss.png',
      faceWithTongue: () => 'assets/emoji/face-with-tongue.png',
      flushedFace: () => 'assets/emoji/flushed-face.png',
      grimacingFace: () => 'assets/emoji/grimacing-face.png',
      grinningFace: () => 'assets/emoji/grinning-face.png',
      smilingFaceWithSunglasses: () =>
          'assets/emoji/smiling-face-with-sunglasses.png',
      poop: () => 'assets/emoji/poop.png',
    );
  }
}

class Emoji extends StatelessWidget {
  const Emoji({
    Key? key,
    required this.value,
  }) : super(key: key);

  final EmojiValue value;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Image.asset(value.asset),
    );
  }
}
