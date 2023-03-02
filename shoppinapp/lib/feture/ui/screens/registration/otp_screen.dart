import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:shoppinapp/core/provider/auth_provider.dart';

import '../../../../core/extension/project_extension.dart';
import 'package:pinput/pinput.dart';

import '../../../../product/AppText/app_string.dart';
import '../../../../product/AppTextStyle/app_text_style.dart';
import '../../../../utils/utils.dart';
import '../../global_widget/custom_elevatedButton.dart';
import '../settings/catagory/user_inforamtion.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final String verificationId;
  OtpScreen({super.key, required this.verificationId});

  late String otpCode = "";

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: false).isLoading;
    return Scaffold(
        body: SafeArea(
      child: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: SingleChildScrollView(
                  child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                ImagePath.maskGroup2.toImage,
                const SizedBox(height: 20),
                Text("Verification",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 20)),
                const SizedBox(height: 10),
                const Text(
                  "Enter the Otp send to your phone number",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.purple.shade200))),
                  onCompleted: (value) {
                    otpCode = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  text: Text(
                    AppString.getString(AppStrings.registerButtonText),
                    style: AppStyles.getStyle(AppTextStyles.loginButton),
                  ),
                  color: Colors.red,
                  sideColor: Colors.transparent,
                  onPressed: () {
                    // final ap =
                    //     Provider.of<AuthProvider>(context, listen: false);
                    // ap.verifyOtp(
                    //   context: context,
                    //   verificationId: verificationId,
                    //   userOtp: userOtp,
                    // );

                    if (otpCode != "") {
                      verifyOtp(context, otpCode);
                    } else {
                      showSnackBar(context, "Enter 6-Digit code");
                    }
                  },
                ),
                sizedBox(16.h),
                const Text("Didnot receive any code?"),
                const SizedBox(
                  height: 16,
                ),
                const Text("Resend new code")
              ]))),
    ));
  }

  SizedBox sizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: verificationId,
        userOtp: userOtp,
        onSuccess: () {
          context.navigateToPage(const UserInforamtion());

          //         // ap.checkExistingUser().then((value) {
          //         //   if (value == true) {
          //         //     //user exists in our app
          //         //   } else {
          //         //     Navigator.pushAndRemoveUntil(
          //         //         context,
          //         //         MaterialPageRoute(
          //         //             builder: (context) => const UserInforamtion()),
          //         //         (route) => false);
          //         //   }
          //         // }
          //         // );
        });
  }
}
