import 'dart:math';

import 'package:balloon/config/app_color.dart';
import 'package:balloon/ui/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Utils {
  static bool isNotEmpty(String? s) => s != null && s.isNotEmpty;

  static bool isEmpty(String? s) => s == null || s.isEmpty;

  static String getRandomArabicLetter({String? correctLetter}) {
    var mainArabicLetters = ['ا', 'ب', 'ت', 'ث', 'ج', 'ح', 'خ', 'د', 'ذ', 'ر', 'ز', 'س', 'ش', 'ص', 'ض', 'ط', 'ظ', 'ع', 'غ', 'ف', 'ق', 'ك', 'ل', 'م', 'ن', 'ه', 'و', 'ي'];

    if (correctLetter != null) {
      var weightedLetters = List<String>.from(mainArabicLetters)..addAll(List.generate(mainArabicLetters.length ~/ 7, (_) => correctLetter));

      final randomIndex = Random().nextInt(weightedLetters.length);
      return weightedLetters[randomIndex];
    }

    final randomIndex = Random().nextInt(mainArabicLetters.length);
    return mainArabicLetters[randomIndex];
  }

  static changeStatusColor({required Color color, Brightness? statusBarIconBrightness}) async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
  }

  static String removeHtmlTags(String htmlString) {
    final RegExp regExp = RegExp(r'<[^>]*>|&[^;]+;', multiLine: true, caseSensitive: false);

    return htmlString.replaceAll(regExp, ' ').trim();
  }

  static double calculateLargestHeightOfWidget(List<Container> containers) {
    double largestHeight = 0;
    for (Container container in containers) {
      largestHeight = max(largestHeight, container.constraints?.maxHeight ?? 0);
    }
    return largestHeight;
  }

  static showLoadingDialog([String? text]) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    Get.dialog(
      PopScope(
        canPop: false,
        child: CustomLoadingDialog(
          title: text ?? 'Loading ...'.tr,
        ),
      ),
      barrierDismissible: false,
      useSafeArea: false,
    );
  }

  static void hideLoadingDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  static showToast({String title = '', String message = '', ToastType type = ToastType.error}) {
    switch (type) {
      case ToastType.error:
        Toast.error(
          title: Text(title),
          displayTitle: title.isEmpty ? false : true,
          description: Text(message),
          animationType: AnimationType.fromTop,
          animationDuration: const Duration(seconds: 2),
          toastDuration: const Duration(seconds: 5),
          autoDismiss: true,
        ).show(Get.context!);
        break;
      case ToastType.success:
        Toast.success(
          title: Text(title),
          displayTitle: title.isEmpty ? false : true,
          description: Text(message),
          animationType: AnimationType.fromTop,
          animationDuration: const Duration(seconds: 2),
          toastDuration: const Duration(seconds: 5),
          autoDismiss: true,
        ).show(Get.context!);
        break;
      case ToastType.info:
        Toast.info(
          title: Text(title),
          displayTitle: title.isEmpty ? false : true,
          description: Text(message),
          animationType: AnimationType.fromTop,
          animationDuration: const Duration(seconds: 2),
          toastDuration: const Duration(seconds: 5),
          autoDismiss: true,
        ).show(Get.context!);
        break;
      case ToastType.warning:
        Toast.warning(
          title: Text(title),
          displayTitle: title.isEmpty ? false : true,
          description: Text(message),
          animationType: AnimationType.fromTop,
          animationDuration: const Duration(seconds: 2),
          toastDuration: const Duration(seconds: 5),
          autoDismiss: true,
        ).show(Get.context!);
        break;
      default:
        break;
    }
  }

  static Future<bool> showAreYouSureDialog({String? title, String? content}) async {
    var result = await Get.defaultDialog(
      title: title ?? 'Are you sure?'.tr,
      content: Text(
        content ?? '',
        textAlign: TextAlign.center,
      ),
      radius: 25,
      cancel: CustomButton(
        fixed: true,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        onPressed: () {
          Get.back();
        },
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.primaryColor,
        side: BorderSide(color: AppColor.primaryColor),
        child: Text('Cancel'.tr),
      ),
      confirm: CustomButton(
        fixed: true,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        onPressed: () {
          Get.back(result: true);
        },
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.red,
        side: const BorderSide(color: AppColor.red),
        child: Text('Confirm'.tr),
      ),
      barrierDismissible: true,
    );
    return result ?? false;
  }
}
