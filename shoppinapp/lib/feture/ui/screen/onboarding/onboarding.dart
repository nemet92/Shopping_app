import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:kartal/kartal.dart';

import '../../../../core/service/extension/project_extension.dart';
import '../../../../product/mixin.dart';
import '../../../../product/routes_pages.dart';

// ignore: must_be_immutable
class OnboradingPage extends StatelessWidget with OnboardingMixin {
  OnboradingPage({super.key});

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
            body: pageviewOneText,
          ),
          PageViewModel(
            image: ImagePath.delivery.toImage,
            title: "Delivery",
            body: pageviewTwoText,
          ),
        ],
        done: const Text("Next"),
        onDone: () => context.navigateToReset(RoutPages.home.name));
  }
}
