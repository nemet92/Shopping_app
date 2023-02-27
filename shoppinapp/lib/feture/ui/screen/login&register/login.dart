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
import '../../global_widget/custom_ElevatedButton.dart';
import '../../global_widget/custom_TextFormFiled.dart';
import '../register/register_page.dart';
import '../../global_widget/globalNavigationBar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MobxStateManagement mobxStateManagement = MobxStateManagement();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final bool _validateUserName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: SingleChildScrollView(
        child: StreamBuilder(builder: (context, AsyncSnapshot snapshot) {
          return Observer(
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
                    prefixIcon: const Icon(Icons.person),
                    usernameController: emailController,
                    hintText: AppString.getString(AppStrings.userHint),
                    validator: _validateUserName,
                    errorText: "errorText".tr(),
                  ),
                  sizedBox(10.h),
                  CustomTextFormFiled(
                    validator: _validateUserName,
                    errorText: "errorText".tr(),
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
                    onPressed: () async {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        final model = UserLoginModel(
                            email: emailController.text,
                            password: passwordController.text);
                        await mobxStateManagement.signInEmailAndPassword(model);
                        if (mobxStateManagement.serviceCode == 200) {
                          context.navigateToPage(const GlobalNavigationBar());
                        }
                      }
                    },
                  ),
                  sizedBox(25.h),
                  CustomElevatedButton(
                    text: RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                            text:
                                AppString.getString(AppStrings.registerButton1),
                            style: AppStyles.getStyle(
                                AppTextStyles.registerButton1)),
                        TextSpan(
                            text:
                                AppString.getString(AppStrings.registerButton2),
                            style: AppStyles.getStyle(
                                AppTextStyles.registerButton2))
                      ],
                    )),
                    color: Colors.white,
                    sideColor: Colors.black,
                    onPressed: () {
                      context.navigateToPage(const RegisterPage());
                      // _registerDialog(context);
                    },
                  )
                ],
              );
            },
          );
        }),
      ),
    ));
  }

// RegisterAlertDialog

  SizedBox sizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}
