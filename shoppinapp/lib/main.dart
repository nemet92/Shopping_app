import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppinapp/feture/ui/screen/home/home.dart';
import 'package:shoppinapp/feture/ui/screen/login/login.dart';
import 'package:shoppinapp/feture/ui/screen/register/register.dart';
import 'package:shoppinapp/product/routes_pages.dart';

import 'feture/ui/screen/onboarding/onboarding.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: const Size(360, 690),
      builder: (context, child) => SafeArea(
        child: MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xffFFFFFF),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: RoutPages.onboarding.name,
            routes: {
              RoutPages.login.name: (context) => LoginPage(),
              RoutPages.home.name: (context) => const HomePage(),
              RoutPages.register.name: (context) => const Register(),
            },
            home: OnboradingPage()),
      ),
    );
  }
}
