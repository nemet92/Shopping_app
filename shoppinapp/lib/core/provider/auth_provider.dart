import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shoppinapp/feture/ui/screen/register/otp/otp_page.dart';
import 'package:shoppinapp/utils/utils.dart';

import '../../feture/ui/screen/settings/catagory/user_inforamtion.dart';

class AuthProvider extends ChangeNotifier {
  // bool _isSignedIn = false;
  // bool get isSignedIn => _isSignedIn;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String? get uid => _uid;

  // final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // AuthProvider() {
  //   checkSign();
  // }

  // void checkSign() async {
  //   final SharedPreferences s = await SharedPreferences.getInstance();
  //   _isSignedIn = s.getBool("is_signedin") ?? false;
  //   notifyListeners();
  // }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            // await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: ((verificationId, forceResendingToken) {
            // print("verificationYoxla$verificationId");
            // print("forceResendingTokenYoxla$forceResendingToken");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OtpScreen(
                          verificationId: verificationId,
                        )));
          }),
          codeAutoRetrievalTimeout: ((verificationId) {}));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    // required Function onSuccess
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      _firebaseAuth.signInWithCredential(creds);
      context.navigateToPage(const UserInforamtion());

      // User? user = (await _firebaseAuth.signInWithCredential(creds)).user;
      // if (user != null) {
      //   _uid = user.uid;
      //   onSuccess();
      // }
      // _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

//Database operations
  // Future<bool> checkExistingUser() async {
  //   DocumentSnapshot snapshot =
  //       await _firebaseFirestore.collection("users").doc(_uid).get();
  //   if (snapshot.exists) {
  //     print("new exists");
  //     return true;
  //   } else {
  //     print("new user");
  //     return false;
  //   }
  // }
}
