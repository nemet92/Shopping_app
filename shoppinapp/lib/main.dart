import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoppinapp/feture/ui/global_widget/custom_NavigationBar.dart';
import 'package:shoppinapp/firebase_options.dart';
import 'package:shoppinapp/product/routes_pages.dart';
import 'core/provider/auth_provider.dart';
import 'feture/ui/screens/login/login_screen.dart';
import 'feture/ui/screens/onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
    path: 'assets/translations', // <-- change the path of the translation files
    fallbackLocale: const Locale('en', 'US'), child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: const Size(360, 690),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.deviceLocale,
            theme: ThemeData(
                textTheme: const TextTheme(
                    labelMedium: TextStyle(),
                    bodyMedium: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                scaffoldBackgroundColor: const Color(0xffFFFFFF),
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.transparent,
                    centerTitle: false,
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20))),
            debugShowCheckedModeBanner: false,
            initialRoute: RoutPages.login.name,
            routes: {
              RoutPages.login.name: (context) => const LoginScreen(),
              RoutPages.home.name: (context) => const GlobalNavigationBar(),
              // RoutPages.register.name: (context) => const Register(),
            },
            home: const OnboradingPage()),
      ),
    );
  }
}
