import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:shoppinapp/core/mobx/mobx_view_model.dart';
import 'package:shoppinapp/core/service/model/passwordReset_model.dart';
import 'package:shoppinapp/product/AppTextStyle/app_text_style.dart';
import 'package:shoppinapp/product/AppText/app_string.dart';

import '../../../../core/extension/project_extension.dart';
import '../../../../core/service/model/login_model.dart';
import '../../../../utils/utils.dart';
import '../../global_widget/custom_elevatedButton.dart';
import '../../global_widget/custom_textFormFiled.dart';
import '../../global_widget/custom_navigationBar.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late MobxStateManagement mobxStateManagement = MobxStateManagement();

  late TextEditingController emailController = TextEditingController();

  late TextEditingController passwordController = TextEditingController();
  late final bool _validateUserName = false;

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
                errorText: "errorText",
                prefixIcon: const Icon(Icons.person),
                usernameController: emailController,
                hintText: AppString.getString(AppStrings.userHint),
              ),
              sizedBox(10.h),
              // CustomTextFormFiled(
              //   validator: _validatePassword,
              //   errorText: (passwordController.text.isEmpty == true)
              //       ? "errorText".tr()
              //       : "errorPassword".tr(),
              //   // "errorText".tr(),
              //   prefixIcon: const Icon(Icons.key),
              //   usernameController: passwordController,
              //   hintText: AppString.getString(AppStrings.passwordHint),
              //   obscureText: mobxStateManagement.isVisible,
              //   suffixIcon: IconButton(
              //     icon: Icon(mobxStateManagement.isVisible
              //         ? Icons.visibility_off
              //         : Icons.visibility),
              //     onPressed: () {
              //       mobxStateManagement.changeVisibleValue();
              //     },
              //   ),
              // ),
              sizedBox(10.h),
              CustomElevatedButton(
                text: Text(
                  AppString.getString(AppStrings.loginButton),
                  style: AppStyles.getStyle(AppTextStyles.loginButton),
                ),
                color: Colors.red,
                sideColor: Colors.transparent,
                onPressed: () {
                  final model = PasswordResetModel(
                    email: emailController.text,
                  );
                  mobxStateManagement.password(model);
                  print("budur status${mobxStateManagement.serviceCode}");
                },
              ),
              sizedBox(25.h),
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
