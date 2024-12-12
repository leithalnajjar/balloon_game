import 'dart:developer';

import 'package:balloon/config/constant.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class AppController extends GetxController {
  static AppController get to => Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());

  final packageInfo = Rxn<PackageInfo>();

  @override
  void onInit() {
    super.onInit();
    WakelockPlus.enable();
    initLanguage();
    initVersionNumber();
  }

  initVersionNumber() async {
    packageInfo.value = await PackageInfo.fromPlatform();
  }

  initLanguage() {
    if (sharedPrefsClient.language == "") {
      sharedPrefsClient.language = 'ar';
    }
  }
}
