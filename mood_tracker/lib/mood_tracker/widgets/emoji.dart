import 'package:flutter/material.dart';
import 'package:mood_tracker/shared/index.dart';

enum Mood {
  grin,
  love,
  blush,
  pokerFace,
  sob,
  angry,
  tired,
  vomiting;

  Widget get emoji {
    switch (this) {
      case Mood.grin:
        return Assets.images.emojiGrin.image();
      case Mood.love:
        return Assets.images.emojiHeartEyes.image();
      case Mood.blush:
        return Assets.images.emojiBlush.image();
      case Mood.pokerFace:
        return Assets.images.emojiSunglasses.image();
      case Mood.sob:
        return Assets.images.emojiSob.image();
      case Mood.angry:
        return Assets.images.emojiFaceWithSymbolsOnMouth.image();
      case Mood.tired:
        return Assets.images.emojiTiredFace.image();
      case Mood.vomiting:
        return Assets.images.emojiFaceVomiting.image();
    }
  }

  static findByName(String name) {
    switch (name) {
      case 'grin':
        return Mood.grin;
      case 'love':
        return Mood.love;
      case 'blush':
        return Mood.blush;
      case 'pokerFace':
        return Mood.pokerFace;
      case 'sob':
        return Mood.sob;
      case 'angry':
        return Mood.angry;
      case 'tired':
        return Mood.tired;
      case 'vomiting':
        return Mood.vomiting;
    }
  }

  @override
  String toString() => super.toString().split('.').last;
}

class Emoji extends StatelessWidget {
  final Mood mood;
  const Emoji({super.key, required this.mood});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.size24,
      height: Sizes.size24,
      child: mood.emoji,
    );
  }
}
