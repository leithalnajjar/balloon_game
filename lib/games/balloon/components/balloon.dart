import 'dart:ui';

import 'package:balloon/config/app_color.dart';
import 'package:balloon/games/balloon/balloon_controller.dart';
import 'package:balloon/games/balloon/balloon_game.dart';
import 'package:flame/components.dart';
import 'package:flame/text.dart';

class Balloon extends SpriteComponent with HasGameRef<BalloonGame> {
  final String letter;
  final _controller = BalloonController.to;

  Balloon({
    required this.letter,
  });

  Rect get bottomLine => Rect.fromLTWH(x, y + height - 1, width, 1);

  @override
  Future<void> onLoad() async {
    final textComponent = TextComponent(
      text: letter,
      textRenderer: TextPaint(
        style: const TextStyle(
          color: AppColor.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    )
      ..anchor = Anchor.center
      ..position = Vector2(size.x / 2, size.y - 37);

    add(textComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    y += _controller.speed * dt;

    if (bottomLine.overlaps(_controller.player.topLine)) {
      removeFromParent();

      if (letter == _controller.correctLetter) {
        _controller.collectCorrect();
      } else {
        _controller.collectIncorrect();
      }
    }

    if (y > gameRef.size.y) {
      removeFromParent();
    }
  }
}
