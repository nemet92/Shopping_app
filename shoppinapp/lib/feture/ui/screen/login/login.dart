import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:shoppinapp/core/service/mobx_view_model.dart';
import 'package:shoppinapp/feture/ui/screen/home/home.dart';
import 'package:shoppinapp/product/AppTextStyle/app_text_style.dart';
import 'package:shoppinapp/product/AppText/app_string.dart';

import '../../../../core/extension/project_extension.dart';
import '../../../../model/login_model.dart';
import '../../global_widget/CustomElevatedButton.dart';
import '../../global_widget/CustomTextFormFiled.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginViewMode = LoginViewMode();

  // late final IService iService;

  TextEditingController loginController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController registerNameController = TextEditingController();

  TextEditingController registerAdressController = TextEditingController();

  // @override
  // void initState() {
  //   iService = GeneralService();
  //   super.initState();
  // }

  final registerMode = LoginViewMode();

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
            Text(
              AppString.getString(AppStrings.loginContent),
              style: AppStyles.getStyle(AppTextStyles.loginContentStyle),
            ),
            sizedBox(25.h),
            CustomTextFormFiled(
                prefixIcon: const Icon(Icons.person),
                username: loginController,
                hintText: AppString.getString(AppStrings.userHint)),
            sizedBox(10.h),
            Observer(builder: (_) {
              return CustomTextFormFiled(
                prefixIcon: const Icon(Icons.key),
                username: passwordController,
                hintText: AppString.getString(AppStrings.passwordHint),
                obscureText: loginViewMode.isVisible,
                sufixIcon: IconButton(
                  icon: Icon(loginViewMode.isVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    loginViewMode.changeVisibleValue();
                  },
                ),
              );
            }),
            sizedBox(35.h),
            CustomElevatedButton(
              text: Text(
                AppString.getString(AppStrings.loginButton),
                style: AppStyles.getStyle(AppTextStyles.loginButton),
              ),
              color: Colors.red,
              sideColor: Colors.transparent,
              onPressed: () async {
                if (loginController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  final model = UserLoginModel(
                      email: loginController.text,
                      password: passwordController.text);

                  await registerMode.postLogin(model);
                  context.navigateToPage(const HomePage());

                  // await iService.postLogin(model);
                  //   if (registerMode.statusCode == 200) {
                  //     context.navigateToPage(const HomePage());
                  //   } else {
                  // print("There is error ");
                  // }
                }

                // context.navigateToReset(RoutPages.home.name);
                // context.navigateToPage(
                //   const HomePage(),
                // );
              },
            ),
            sizedBox(25.h),
            CustomElevatedButton(
              text: RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text: AppString.getString(AppStrings.registerButton1),
                      style: AppStyles.getStyle(AppTextStyles.registerButton1)),
                  TextSpan(
                      text: AppString.getString(AppStrings.registerButton2),
                      style: AppStyles.getStyle(AppTextStyles.registerButton2))
                ],
              )),
              color: Colors.white,
              sideColor: Colors.black,
              onPressed: () {
                _registerDialog(context);
              },
            )
          ],
        ),
      ),
    ));
  }

// RegisterAlertDialog
  Future<dynamic> _registerDialog(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            scrollable: true,
            insetPadding: const EdgeInsets.symmetric(horizontal: 12),
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.getString(AppStrings.alertTitle),
                  style: AppStyles.getStyle(AppTextStyles.alertTitle),
                ),
                IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
            content: Text(
              AppString.getString(AppStrings.alertcontent),
              style: AppStyles.getStyle(AppTextStyles.alertContent),
            ),
            actions: [
              CustomTextFormFiled(
                  username: loginController,
                  hintText: AppString.getString(AppStrings.nameHint)),
              sizedBox(10.h),
              CustomTextFormFiled(
                  username: registerNameController,
                  hintText: AppString.getString(AppStrings.passwordHint)),
              sizedBox(10.h),
              CustomTextFormFiled(
                  username: registerAdressController,
                  hintText: AppString.getString(AppStrings.adrressHint)),
              sizedBox(10.h),
              CustomElevatedButton(
                  text:
                      Text(AppString.getString(AppStrings.registerButtonText)),
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
