import 'package:balloon/config/constant.dart';
import 'package:balloon/controllers/splash_controller.dart';
import 'package:balloon/ui/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = SplashController.to;

  @override
  void initState() {
    _controller.init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
      enableSafeArea: false,
      body: Center(
        child: Image.asset(
          Constant.kAssetLogoSplash,
          width: Get.width,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

