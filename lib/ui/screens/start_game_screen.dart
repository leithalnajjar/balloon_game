import 'package:balloon/config/app_color.dart';
import 'package:balloon/config/constant.dart';
import 'package:balloon/controllers/start_game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartGameScreen extends StatefulWidget {
  const StartGameScreen({super.key});

  @override
  State<StartGameScreen> createState() => _StartGameScreenState();
}

class _StartGameScreenState extends State<StartGameScreen> {
  final _controller = StartGameController.to;

  @override
  void initState() {
    _controller.generateRandomLetter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Constant.kAssetBackgroundBalloonStart,
            fit: BoxFit.cover,
            width: Get.width,
            height: Get.height,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.accentColor.withOpacity(0.6),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: '${'Please collect'.tr} ',
                      style: Constant.kStyleTextTitle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '3',
                          style: Constant.kStyleTextLarge.copyWith(
                            color: AppColor.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' ${'letters'.tr} ',
                          style: Constant.kStyleTextTitle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: _controller.randomLetter.value,
                          style: Constant.kStyleTextLarge.copyWith(
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _controller.startGame();
                    },
                    child: Text("Start".tr),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

