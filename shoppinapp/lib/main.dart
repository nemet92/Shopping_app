import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppinapp/feture/ui/screen/home/home.dart';
import 'package:shoppinapp/feture/ui/screen/login&register/login.dart';
import 'package:shoppinapp/feture/ui/screen/register/register.dart';
import 'package:shoppinapp/firebase_options.dart';
import 'package:shoppinapp/product/routes_pages.dart';

import 'feture/ui/screen/onboarding/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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
            initialRoute: RoutPages.home.name,
            routes: {
              RoutPages.login.name: (context) => const LoginPage(),
              RoutPages.home.name: (context) => const HomePage(),
              RoutPages.register.name: (context) => const Register(),
            },
            home: const OnboradingPage()),
      ),
    );
  }
}
