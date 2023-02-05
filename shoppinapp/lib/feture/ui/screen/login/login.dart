import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/service/extension/project_extension.dart';
import '../../../../product/mixin.dart';
import '../../../../product/routes_pages.dart';
import '../../global_widget/CustomElevatedButton.dart';
import '../../global_widget/CustomTextFormFiled.dart';

class LoginPage extends StatelessWidget with HomePageMixin, RegisterMixin {
  LoginPage({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: context.mediaQuery.size.height * 0.4,
                  child: ImagePath.maskGroup2.toImage),
              homeTextStyle(),
              sizedBox(25.h),
              CustomTextFormFiled(
                  prefixIcon: const Icon(Icons.person),
                  username: usernameController,
                  hintText: userHintText),
              sizedBox(10.h),
              CustomTextFormFiled(
                prefixIcon: const Icon(Icons.key),
                username: passwordController,
                hintText: passwordHintText,
              ),
              sizedBox(35.h),
              CustomElevatedButton(
                text: loginText(),
                color: Colors.red,
                sideColor: Colors.transparent,
                onPressed: () {
                  context.navigateToReset(RoutPages.home.name);
                },
              ),
              sizedBox(30.h),
              CustomElevatedButton(
                text: createText(),
                color: Colors.white,
                sideColor: Colors.black,
                onPressed: () {
                  _registerDialog(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _registerDialog(BuildContext context) {
    return showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 12),
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("Sign up "), Icon(Icons.cancel)],
            ),
            content: const Text("data"),
            actions: [
              CustomTextFormFiled(
                  username: usernameController, hintText: userHintText),
              sizedBox(10.h),
              CustomTextFormFiled(
                  username: usernameController, hintText: userHintText),
              sizedBox(10.h),
              CustomTextFormFiled(
                  username: usernameController, hintText: userHintText),
              sizedBox(10.h),
              CustomElevatedButton(
                  text: registerButtonText(),
                  color: Colors.red,
                  sideColor: Colors.red,
                  onPressed: () {})
            ],
          );
        });
  }

  SizedBox sizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}
