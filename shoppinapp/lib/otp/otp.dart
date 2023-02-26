import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppinapp/core/provider/auth_provider.dart';
import 'package:shoppinapp/utils/utils.dart';

import '../core/extension/project_extension.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final String verificationId;
  OtpScreen({super.key, required this.verificationId});
  String otpCode = "";
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
                const Text(
                  "Verification",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                  onSubmitted: (value) {
                    otpCode = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade600,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        if (otpCode != null) {
                          verifyOtp(context, otpCode);
                        } else {
                          showSnackBar(context, "Enter 6-Digit code");
                        }
                      },
                      child: const Text("Verify")),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text("Didnot receive any code?"),
                const SizedBox(
                  height: 16,
                ),
                const Text("Resend new code")
              ]))),
    ));
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    ap.verifyOtp(
        context: context,
        verificationId: verificationId,
        userOtp: userOtp,
        onSuccess: () {});
  }
}
