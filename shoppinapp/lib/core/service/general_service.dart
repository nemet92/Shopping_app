import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoppinapp/core/service/model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:shoppinapp/core/service/model/passwordReset_model.dart';

import 'key_string.dart';

abstract class IService {
  int? statusCode;
  Future<void> signIn(UserLoginModel model);
  Future<void> signUp(UserLoginModel model);
  Future<void> resetPassword(PasswordResetModel model);
}

class GeneralService implements IService {
  Dio dio = Dio();
  @override
  int? statusCode;

  @override
  Future<void> signIn(UserLoginModel model) async {
    final jsonModel = jsonEncode(model.toJson());
    final response = await dio.post(signInKey, data: jsonModel);
    if (response.statusCode == 200) {
      statusCode = response.statusCode;
      return response.data;
    } else {
      return;
    }
  }

  @override
  Future<void> signUp(UserLoginModel model) async {
    Dio dio = Dio();
    final response = await dio.post(signUpKey, data: model);
    if (response.statusCode == 200) {
      statusCode = response.statusCode;

      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: model.email ?? "", password: model.password ?? "");
    }
  }

  @override
  Future<void> resetPassword(PasswordResetModel model) async {
    Dio dio = Dio();
    final response = await dio.post(
      passwordResetKey,
    );
    // if (response.statusCode == 200) {
    //   statusCode = response.statusCode;

    //   print(statusCode);

    FirebaseAuth.instance.sendPasswordResetEmail(email: model.email ?? "");
  }
}


  // if (response.data["data"] == "Please check your email to reset password.") {
  //   Get.snackbar("success","Email Sent Sucessfully!");
  // } else {
  //   Get.snackbar("error", "Email Not Sent. Please try again.");
  // }
  //   print("res: ${response.data}");
  // } catch (e) {
  //   Get.snackbar("error", e.toString());
  //   print(e);
  // }

