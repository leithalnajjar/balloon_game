import 'dart:math';
import 'dart:async' as async;

import 'package:balloon/config/app_color.dart';
import 'package:balloon/config/constant.dart';
import 'package:balloon/config/utils.dart';
import 'package:balloon/controllers/start_game_controller.dart';
import 'package:balloon/games/balloon/components/balloon.dart';
import 'package:balloon/games/balloon/components/player.dart';
import 'package:balloon/ui/screens/start_game_screen.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BalloonController extends GetxController {
  static BalloonController get to => Get.isRegistered<BalloonController>() ? Get.find<BalloonController>() : Get.put(BalloonController());

  late FlameGame game;
  late Player player;
  late TextComponent collectedLettersTextComponent;
  final List<SpriteComponent> lives = [];

  String correctLetter = "";
  int collectedLetters = 0;
  int speed = 100;
  double spawnInterval = 2;

  final Random random = Random();
  final List<String> balloonColors = [
    Constant.kAssetRedBalloonBalloonGame,
    Constant.kAssetYellowBalloonBalloonGame,
    Constant.kAssetBlueBalloonBalloonGame,
    Constant.kAssetYellowBalloonBalloonGame,
  ];

  async.Timer? balloonSpawnerTimer;
  async.Timer? speedIncreaseTimer;

  initializeGame(FlameGame gameRef) {
    game = gameRef;
    correctLetter = StartGameController.to.randomLetter.value;
  }

  addBackground() async {
    final background = SpriteComponent()
      ..sprite = await game.loadSprite(Constant.kAssetBackgroundBalloonGame)
      ..size = game.size;
    game.add(background);
  }

  addLives() async {
    for (int i = 0; i < 3; i++) {
      final life = SpriteComponent()
        ..sprite = await game.loadSprite(Constant.kAssetHeartBalloonGame)
        ..size = Vector2(90, 50)
        ..position = Vector2(10 + i * 60, 40)
        ..priority = 10;
      lives.add(life);
      game.add(life);
    }
  }

  addPlayer() async {
    player = Player()
      ..sprite = await game.loadSprite(Constant.kAssetPlayerBalloonGame)
      ..size = Vector2(100, 150)
      ..position = Vector2(game.size.x / 2 - 50, game.size.y - 160)
      ..priority = 10;

    game.add(player);
  }

  addCollectedLetters() {
    collectedLettersTextComponent = TextComponent(
      text: "${'Collected'.tr}: 0",
      position: Vector2(30, 100),
      priority: 20,
      textRenderer: TextPaint(style: const TextStyle(color: AppColor.black, fontSize: 24)),
    );
    game.add(collectedLettersTextComponent);
  }

  updateCollectedCount() {
    collectedLettersTextComponent.text = "${'Collected'.tr}: $collectedLetters";
  }

  spawnBalloons() {
    balloonSpawnerTimer = async.Timer.periodic(Duration(milliseconds: (spawnInterval * 1000).toInt()), (_) async {
      final balloonColor = balloonColors[random.nextInt(balloonColors.length)];
      final letter = Utils.getRandomArabicLetter(correctLetter: correctLetter);
      final balloon = Balloon(letter: letter)
        ..sprite = await game.loadSprite(balloonColor)
        ..size = Vector2(50, 70)
        ..position = Vector2(random.nextDouble() * (game.size.x - 50), -70)
        ..priority = 5;
      game.add(balloon);
    });
  }


  addCorrectLetterDisplay() {
    final containerSize = Vector2(100, 50);
    final container = RectangleComponent(
      size: containerSize,
      position: Vector2(game.size.x - containerSize.x - 20, 40),
      paint: Paint()..color = AppColor.white,
      anchor: Anchor.topLeft,
      priority: 20,
    );

    final correctLetterTextComponent = TextComponent(
      text: correctLetter,
      position: containerSize / 2,
      anchor: Anchor.center,
      priority: 20,
      textRenderer: TextPaint(
        style: Constant.kStyleTextLarge.copyWith(color: AppColor.primaryColor),
      ),
    );

    container.add(correctLetterTextComponent);

    game.add(container);
  }

  restartSpawningBalloons() {
    balloonSpawnerTimer?.cancel();
    spawnBalloons();
  }

  changeSpeed() {
    speedIncreaseTimer = async.Timer.periodic(const Duration(seconds: 5), (_) async {
      if (speed < 160) {
        speed += 10;
        spawnInterval -= 0.2;
      }
      restartSpawningBalloons();
    });
  }

  collectCorrect() {
    collectedLetters++;
    updateCollectedCount();
    if (collectedLetters >= 3) {
      checkWinningCondition();
    }
  }

  void collectIncorrect() {
    if (lives.isNotEmpty) {
      final lastLife = lives.removeLast();
      game.remove(lastLife);
      if (lives.isEmpty) {
        async.Future.delayed(const Duration(milliseconds: 50)).then(
          (value) {
            showGameOverDialog();
          },
        );
      }
    }
  }

  increaseSpeed() {
    speed += 10;
  }

  checkWinningCondition() {
    game.pauseEngine();
    stopAllTimers();
    Get.dialog(
      PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text("Congratulations!".tr),
          content: Text("${"You collected".tr} 3 ${"letters".tr} $correctLetter"),
          actions: [
            TextButton(
              onPressed: () {
                Get.offAll(() => const StartGameScreen());
              },
              child: Text("Play again".tr),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  showGameOverDialog() {
    game.pauseEngine();
    stopAllTimers();
    Get.dialog(
      PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text("Game over".tr),
          content: Text("You lost all lives!".tr),
          actions: [
            TextButton(
              onPressed: () {
                Get.offAll(() => const StartGameScreen());
              },
              child: Text("Play again".tr),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  stopAllTimers() {
    balloonSpawnerTimer?.cancel();
    speedIncreaseTimer?.cancel();
  }
}
