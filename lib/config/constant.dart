import 'package:balloon/config/app_color.dart';
import 'package:balloon/config/shared_prefs_client.dart';
import 'package:flutter/material.dart';

final sharedPrefsClient = SharedPrefsClient();

class Constant {
  static const kStyleTextSmall = TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: AppColor.black);
  static const kStyleTextDefault = TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: AppColor.black);
  static const kStyleTextTitle = TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: AppColor.black);
  static const kStyleTextLarge = TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: AppColor.black);

  static const fractionDigits = 3;
  static const dateFormat = 'yyyy-MM-dd';
  static const timeFormat = 'HH:mm a';
  static const country = 'JO';

  static String kAssetLogo = "assets/images/logo.png";
  static String kAssetLogoSplash = "assets/images/logo.png";
  static String kAssetBackgroundBalloonStart = "assets/images/background_start_game.jpg";
  static String kAssetBackgroundBalloonGame = "background.jpg";
  static String kAssetHeartBalloonGame = "heart.png";
  static String kAssetPlayerBalloonGame = "player.png";
  static String kAssetRedBalloonBalloonGame = "red_balloon.png";
  static String kAssetYellowBalloonBalloonGame = "yellow_balloon.png";
  static String kAssetBlueBalloonBalloonGame = "blue_balloon.png";
  static String kAssetGreenBalloonBalloonGame = "green_balloon.png";
}
