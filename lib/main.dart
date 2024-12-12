import 'package:balloon/config/app_themes.dart';
import 'package:balloon/config/constant.dart';
import 'package:balloon/config/localization/translations.dart';
import 'package:balloon/controllers/app_controller.dart';
import 'package:balloon/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends GetView<AppController> {
  MyApp({super.key});

  final _controller = AppController.to;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: Locale(sharedPrefsClient.language),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''),
      ],
      fallbackLocale: const Locale('ar'),
      theme: AppThemes(context).appThemeData[AppTheme.lightTheme],
      darkTheme: AppThemes(context).appThemeData[AppTheme.darkTheme],
      themeMode: ThemeMode.light,
      showSemanticsDebugger: false,
      home: const SplashScreen(),
    );
  }
}
