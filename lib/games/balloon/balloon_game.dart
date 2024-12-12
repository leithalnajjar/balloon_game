import 'dart:developer';

import 'package:balloon/games/balloon/balloon_controller.dart';
import 'package:flame/game.dart';

class BalloonGame extends FlameGame {
  final _controller = BalloonController.to;


  @override
  Future<void> onLoad() async {
    _controller.initializeGame(this);
    _controller.addBackground();
    _controller.addLives();
    _controller.addPlayer();
    _controller.addCollectedLetters();
    _controller.addCorrectLetterDisplay();
    _controller.spawnBalloons();
    _controller.changeSpeed();
  }
}
