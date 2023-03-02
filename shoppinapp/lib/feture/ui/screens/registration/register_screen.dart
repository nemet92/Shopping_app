import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:shoppinapp/core/extension/project_extension.dart';
import 'package:shoppinapp/core/provider/auth_provider.dart';
import 'package:shoppinapp/feture/ui/global_widget/custom_elevatedButton.dart';
import 'package:shoppinapp/feture/ui/screens/login/login_screen.dart';

import '../../../../product/AppText/app_string.dart';
import '../../../../product/AppTextStyle/app_text_style.dart';
import '../../../../utils/utils.dart';
import '../../global_widget/custom_textFormFiled.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController phoneController = TextEditingController();

  final bool _validateRegister = false;

  Country selectedCountry = Country(
      phoneCode: "994",
      countryCode: "AZ",
      e164Sc: 0,
      e164Key: "",
      geographic: true,
      level: 1,
      name: "Az",
      example: "Az",
      displayName: "Az",
      displayNameNoCountryCode: "AZ");

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.navigateToPage(const LoginScreen());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(children: [
              ImagePath.maskGroup2.toImage,
              Text("Register",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 24)),
              const SizedBox(height: 10),
              Text(
                AppString.getString(AppStrings.register),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.normal),
              ),

              // const Text(
              //   "Add your phone number. We'll send you a verification code",
              //   style: TextStyle(
              //     fontSize: 14,
              //     color: Colors.black38,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(height: 20),
              CustomTextFormFiled(
                usernameController: phoneController,
                hintText: "Enter Phone Number",
                validator: _validateRegister,
                onChanged: (value) {
                  setState(() {
                    phoneController.text = value;
                  });
                },
                prefixIcon: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: const CountryListThemeData(
                            bottomSheetHeight: 550,
                          ),
                          onSelect: (value) {
                            setState(() {
                              selectedCountry = value;
                            });
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                suffixIcon: phoneController.text.length > 7
                    ? Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    : null,
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
                  if (phoneController.text.isNotEmpty) {
                    sendPhoneNumber();
                  } else {
                    showSnackBar(context, "Nomreni daxil edin");
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }
}
