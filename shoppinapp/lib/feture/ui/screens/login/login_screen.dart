import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:shoppinapp/core/mobx/mobx_view_model.dart';
import 'package:shoppinapp/product/AppTextStyle/app_text_style.dart';
import 'package:shoppinapp/product/AppText/app_string.dart';

import '../../../../core/extension/project_extension.dart';
import '../../../../core/service/model/login_model.dart';
import '../../../../utils/utils.dart';
import '../../global_widget/custom_elevatedButton.dart';
import '../../global_widget/custom_textFormFiled.dart';
import '../registration/register_screen.dart';
import '../../global_widget/custom_navigationBar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late MobxStateManagement mobxStateManagement = MobxStateManagement();

  late TextEditingController emailController = TextEditingController();

  late TextEditingController passwordController = TextEditingController();
  late bool _validateUserName = false;
  late bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: SingleChildScrollView(child: Observer(
        builder: (_) {
          return Column(
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
                validator: _validateUserName,
                errorText: "errorText".tr(),
                prefixIcon: const Icon(Icons.person),
                usernameController: emailController,
                hintText: AppString.getString(AppStrings.userHint),
              ),
              sizedBox(10.h),
              CustomTextFormFiled(
                validator: _validatePassword,
                errorText: (passwordController.text.isEmpty == true)
                    ? "errorText".tr()
                    : "errorPassword".tr(),
                // "errorText".tr(),
                prefixIcon: const Icon(Icons.key),
                usernameController: passwordController,
                hintText: AppString.getString(AppStrings.passwordHint),
                obscureText: mobxStateManagement.isVisible,
                suffixIcon: IconButton(
                  icon: Icon(mobxStateManagement.isVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    mobxStateManagement.changeVisibleValue();
                  },
                ),
              ),
              sizedBox(35.h),
              CustomElevatedButton(
                text: Text(
                  AppString.getString(AppStrings.loginButton),
                  style: AppStyles.getStyle(AppTextStyles.loginButton),
                ),
                color: Colors.red,
                sideColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    // if (emailController.text.isEmpty ||
                    //     passwordController.text.length != 6) {
                    //   _validatePassword = true;
                    //   _validateUserName = true;
                    // } else {
                    //   _validatePassword = false;
                    //   _validateUserName = false;
                    // }
                    login();

                    emailController.text.isEmpty == true
                        ? _validateUserName = true
                        : _validateUserName = false;
                    passwordController.text.isEmpty ||
                            passwordController.text.length != 6
                        ? _validatePassword = true
                        : _validatePassword = false;
                  });
                },
              ),
              sizedBox(25.h),
              CustomElevatedButton(
                text: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                        text: AppString.getString(AppStrings.registerButton1),
                        style:
                            AppStyles.getStyle(AppTextStyles.registerButton1)),
                    TextSpan(
                        text: AppString.getString(AppStrings.registerButton2),
                        style:
                            AppStyles.getStyle(AppTextStyles.registerButton2))
                  ],
                )),
                color: Colors.white,
                sideColor: Colors.black,
                onPressed: () {
                  context.navigateToPage(const RegisterScreen());
                },
              )
            ],
          );
        },
      )),
    ));
  }

  login() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      final model = UserLoginModel(
          email: emailController.text, password: passwordController.text);
      mobxStateManagement.signInEmailAndPassword(model);

      if (mobxStateManagement.serviceCode == 200) {
        context.navigateToPage(const GlobalNavigationBar());

        return showSnackBar(context, "Giriş uğurludur");
      } else {
        return showSnackBar(context, "Istifadeci movcud deyil");
      }
    }
  }

  SizedBox sizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}
