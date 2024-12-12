import 'package:balloon/config/utils.dart';
import 'package:get/get.dart';

class Validation {
  static String? between(value, {double? minQty, double? maxQty}) {
    if (Utils.isEmpty(value)) {
      return 'This field is required'.tr;
    } else if (minQty != null && double.parse(value) < minQty) {
      return '${'Must be greater than or equal to'.tr} $minQty';
    } else if (maxQty != null && double.parse(value) > maxQty) {
      return '${'Must be less than or equal to'.tr} $maxQty';
    }
    return null;
  }

  static String? isEmail(String? email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    if (Utils.isEmpty(email)) {
      return "This field is required".tr;
    } else if (!regExp.hasMatch(email!)) {
      return "Please enter valid email".tr;
    }
    return null;
  }

  static String? isPassword(String? password) {
    String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regExp = RegExp(pattern);

    if (Utils.isEmpty(password)) {
      return "This field is required".tr;
    } else if (!regExp.hasMatch(password!)) {
      return "Password must be at least 8 characters long, include one uppercase letter, one lowercase letter, one number, and one special symbol (@, \$, !, %, *, ?, &).".tr;
    }

    return null;
  }

  static String? isConfirmPassword(String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return "Password does not match".tr;
    }
    return null;
  }

  static String? isRequired(String? text) {
    if (Utils.isEmpty(text)) {
      return "This field is required".tr;
    }
    return null;
  }


  static String? isRequiredDropDown(int? value) {
    if (value == null) {
      return "This field is required".tr;
    }
    return null;
  }


  static String? isRequiredMultiDropDown(List<int>? value) {
    if (value == null || value.isEmpty) {
      return "This field is required".tr;
    }
    return null;
  }
}
