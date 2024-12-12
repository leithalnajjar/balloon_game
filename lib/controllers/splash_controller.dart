import 'package:balloon/ui/screens/start_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.isRegistered<SplashController>() ? Get.find<SplashController>() : Get.put(SplashController());

  init() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      FocusScope.of(Get.context!).requestFocus(FocusNode());
    });
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const StartGameScreen());
    });
  }
}
