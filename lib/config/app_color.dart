import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColor {
  static Color selectColor(Color colorForLight, Color colorForDark) {
    return Get.isDarkMode ? colorForDark : colorForLight;
  }

  static MaterialColor primaryColor = const MaterialColor(
    0xFF673AB7,
    <int, Color>{
      50: Color(0xFFEDE7F6),
      100: Color(0xFFD1C4E9),
      200: Color(0xFFB39DDB),
      300: Color(0xFF9575CD),
      400: Color(0xFF7E57C2),
      500: Color(0xFF673AB7),
      600: Color(0xFF5E35B1),
      700: Color(0xFF512DA8),
      800: Color(0xFF4527A0),
      900: Color(0xFF311B92),
    },
  );
  static MaterialColor accentColor = const MaterialColor(
    0xFF607D8B,
    <int, Color>{
      50: Color(0xFFECEFF1),
      100: Color(0xFFCFD8DC),
      200: Color(0xFFB0BEC5),
      300: Color(0xFF90A4AE),
      400: Color(0xFF78909C),
      500: Color(0xFF607D8B),
      600: Color(0xFF546E7A),
      700: Color(0xFF455A64),
      800: Color(0xFF37474F),
      900: Color(0xFF263238),
    },
  );
  static MaterialColor tertiaryColor = const MaterialColor(
    0xFF1091CB,
    <int, Color>{
      50: Color(0xFF1091CB),
      100: Color(0xFF1091CB),
      200: Color(0xFF1091CB),
      300: Color(0xFF1091CB),
      350: Color(0xFF1091CB),
      400: Color(0xFF1091CB),
      500: Color(0xFF1091CB),
      600: Color(0xFF1091CB),
      700: Color(0xFF1091CB),
      800: Color(0xFF1091CB),
      850: Color(0xFF1091CB),
      900: Color(0xFF1091CB),
    },
  );

  static const Color background = Color(0xFFFAFAFC);
  static const Color green = Color(0xFF48EE6C);
  static const Color orange = Color(0xFFFFA500);
  static const Color blue = Color.fromRGBO(156, 180, 255, 1.0);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFFF3D3D);
  static const Color gray = Color(0xFFA0A0A0);
  static const Color cyanBlue = Color(0xFF5DCDFF);
  static const Color dropdown = Color(0xFFE3E3E3);
  static const Color whiteSmoke = Color(0xFFF5F5F5);
}
