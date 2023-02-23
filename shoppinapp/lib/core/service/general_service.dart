import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoppinapp/core/service/model/login_model.dart';
import 'package:dio/dio.dart';

import 'key_string.dart';

abstract class IService {
  int? statusCode;
  Future<void> signIn(UserLoginModel model);
  Future<void> signUp(UserLoginModel model);
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
      print("$statusCode login");
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
      print(statusCode);
      statusCode = response.statusCode;

      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: model.email ?? "", password: model.password ?? "");
    }
  }
}
