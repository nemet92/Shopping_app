import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:kartal/kartal.dart';
import 'package:shoppinapp/product/AppText/app_string.dart';

import '../../../../core/extension/project_extension.dart';
import '../../../../product/routes_pages.dart';

// ignore: must_be_immutable
class OnboradingPage extends StatelessWidget {
  const OnboradingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  IntroductionScreen _body(BuildContext context) {
    return IntroductionScreen(
        globalBackgroundColor: Colors.white,
        next: const Text("Next"),
        nextFlex: 1,
        showSkipButton: true,
        skip: const Text("Skip"),
        pages: [
          PageViewModel(
            image: ImagePath.grocery.toImage,
            title: "Grocery Shopping",
            body: AppString.getString(AppStrings.onboardingText1),
          ),
          PageViewModel(
            image: ImagePath.delivery.toImage,
            title: "Delivery",
            body: AppString.getString(AppStrings.onboardingText2),
          ),
        ],
        done: const Text("Next"),
        onDone: () => context.navigateToReset(RoutPages.login.name));
  }
}
