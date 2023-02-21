import 'dart:convert';

import 'package:shoppinapp/core/service/model/login_model.dart';
import 'package:dio/dio.dart';

import 'key_string.dart';

abstract class IService {
  int? statusCode;
  Future signUp(UserLoginModel model);
  // Future<void> signUp(UserLoginModel model);
}

class GeneralService implements IService {
  Dio dio = Dio();
  @override
  int? statusCode;

  @override
  Future<void> signUp(UserLoginModel model) async {
    final jsonModel = jsonEncode(model.toJson());
    final response = await dio.post(signIn, data: jsonModel);
    if (response.statusCode == 200) {
      statusCode = response.statusCode;
      return response.data;
    } else {
      return;
    }
  }

//   @override
//   Future<void> signUp(UserLoginModel model) {
// ignore: todo
//     // TODO: implement signUp
//     throw UnimplementedError();
//   }
}
