enum AppStrings {
  onboardingText1,
  onboardingText2,

  loginContent,
  loginButton,
  registerButton1,
  registerButton2,

  alertTitle,
  alertcontent,
  registerButtonText,

  userHint,
  passwordHint,
  nameHint,
  adrressHint,
}

class AppString {
  static String getString(AppStrings string) {
    switch (string) {
      case AppStrings.userHint:
        return "Mobile number and mail";

      case AppStrings.loginContent:
        return "Get groceries delivered at your doordstep in just 15 minutes.";

      case AppStrings.loginButton:
        return "Login";

      case AppStrings.registerButton1:
        return "I am new here.";

      case AppStrings.registerButton2:
        return "Create an account";

      case AppStrings.alertTitle:
        return "Sign Up";

      case AppStrings.alertcontent:
        return "By signing up,I agree to the Privacy Policy and Terms of service";

      case AppStrings.registerButtonText:
        return "Get OTP";

      case AppStrings.onboardingText1:
        return " Grocery shopping can be done in, a variety of ways. Many grocery stores offer online ordering and delivery services, allowing customers to shop from the comfort of their own home.";

      case AppStrings.onboardingText2:
        return "Fast delivery is possible depending on the item and  the shipping method chosen. Many online retailers offer expedited shipping options such as overnight or two-day delivery for an additional fee.";

      // hint text

      case AppStrings.passwordHint:
        return "Password";

      case AppStrings.nameHint:
        return "Name";

      case AppStrings.adrressHint:
        return "Addrres";
    }
  }
}