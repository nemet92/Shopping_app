import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoppinapp/classes/language/demo_localization.dart';
import 'package:shoppinapp/feture/ui/global_widget/custom_navigationBar.dart';
import 'package:shoppinapp/firebase_options.dart';
import 'package:shoppinapp/product/routes_pages.dart';
import 'package:shoppinapp/classes/language/localization_constants.dart';
import 'core/provider/auth_provider.dart';
import 'feture/ui/screens/login/login_screen.dart';
import 'feture/ui/screens/onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return const SizedBox(
          child: Center(
              child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      )));
    } else {
      return ScreenUtilInit(
        splitScreenMode: true,
        designSize: const Size(360, 690),
        builder: (context, child) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthProvider()),
          ],
          child: MaterialApp(
              locale: _locale,
              localizationsDelegates: const [
                DemoLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale("en", "US"),
                Locale("tr", "TR"),
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (locale.languageCode == deviceLocale?.languageCode &&
                      locale.countryCode == deviceLocale?.countryCode) {
                    return deviceLocale;
                  }
                }
                return supportedLocales.first;
              },
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
              initialRoute: RoutPages.home.name,
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
}
