import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AppTextStyles {
  loginContentStyle,
  loginButton,
  registerButton1,
  registerButton2,
  alertTitle,
  alertContent,
  registerButtonStyle
}

class AppStyles {
  static TextStyle getStyle(AppTextStyles style) {
    switch (style) {
      case AppTextStyles.loginContentStyle:
        return TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black);
      case AppTextStyles.loginButton:
        return TextStyle(fontSize: 16.sp);
      case AppTextStyles.registerButton1:
        return TextStyle(
            fontSize: 16.sp,
            color: const Color(0xff000000),
            fontWeight: FontWeight.bold);
      case AppTextStyles.registerButton2:
        return TextStyle(
            fontSize: 16.sp,
            color: const Color(0xffFF5D5D),
            fontWeight: FontWeight.bold);
      case AppTextStyles.alertTitle:
        return TextStyle(
            fontSize: 16.sp,
            color: const Color(0xff000000),
            fontWeight: FontWeight.bold);
      case AppTextStyles.alertContent:
        return TextStyle(
          fontSize: 12.sp,
          color: const Color(0xff777777),
        );
      case AppTextStyles.registerButtonStyle:
        return TextStyle(
          fontSize: 16.sp,
          color: const Color(0xffFF5D5D),
        );
    }
  }
}
