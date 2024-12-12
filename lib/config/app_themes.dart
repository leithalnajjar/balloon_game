import 'package:balloon/config/app_color.dart';
import 'package:balloon/config/constant.dart';
import 'package:flutter/material.dart';

class AppThemes {
  late Map<AppTheme, ThemeData> appThemeData;

  AppThemes(BuildContext context) {
    appThemeData = {
      AppTheme.lightTheme: ThemeData(
        // toggleableActiveColor: AppColor.primaryColor.shade700,
        dialogBackgroundColor: AppColor.white,
        brightness: Brightness.light,
        primarySwatch: AppColor.primaryColor,
        primaryColor: AppColor.primaryColor,
        cardColor: AppColor.white,
        scaffoldBackgroundColor: AppColor.background,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.white,
          unselectedItemColor: AppColor.gray,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.primaryColor,
          selectedLabelStyle: Constant.kStyleTextSmall.copyWith(color: AppColor.primaryColor),
        ),
        appBarTheme: AppBarTheme(
          foregroundColor: AppColor.white,
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColor.white),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColor.primaryColor).copyWith(
          secondary: AppColor.primaryColor.shade700,
          brightness: Brightness.light,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(Constant.kStyleTextDefault.copyWith(fontWeight: FontWeight.bold)),
            foregroundColor: WidgetStateProperty.resolveWith((state) => AppColor.primaryColor),
            overlayColor: WidgetStateProperty.resolveWith((state) => AppColor.primaryColor.withOpacity(0.1)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all<TextStyle>(Constant.kStyleTextTitle.copyWith(fontWeight: FontWeight.bold)),
            backgroundColor: WidgetStateProperty.all<Color>(AppColor.primaryColor),
            foregroundColor: WidgetStateProperty.all<Color>(AppColor.white),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColor.primaryColor,
          selectionHandleColor: AppColor.primaryColor.shade700,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: Constant.kStyleTextDefault.copyWith(color: AppColor.gray),
          labelStyle: Constant.kStyleTextDefault.copyWith(color: AppColor.gray),
          iconColor: AppColor.gray,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.gray, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.gray, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.red, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.gray, width: 1),
          ),
        ),
      ),
    };
  }
}

enum AppTheme { lightTheme, darkTheme }
