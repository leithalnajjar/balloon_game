import 'dart:developer';

import 'package:balloon/config/utils.dart';
import 'package:balloon/games/balloon/balloon_game.dart';
import 'package:flame/game.dart';
import 'package:get/get.dart';

class StartGameController extends GetxController with StateMixin {
  static StartGameController get to => Get.isRegistered<StartGameController>() ? Get.find<StartGameController>() : Get.put(StartGameController());

  final randomLetter = "".obs;

  generateRandomLetter() {
    randomLetter.value = Utils.getRandomArabicLetter();
  }

  startGame() {
    Get.offAll(
      () => GameWidget(
        game: BalloonGame(),
      ),
    );
  }
}
