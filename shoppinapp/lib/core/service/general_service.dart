import 'dart:convert';

import 'package:shoppinapp/model/login_model.dart';
import 'package:dio/dio.dart';

import 'key_string.dart';

abstract class IService {
  int? statusCode;
  Future postLogin(UserLoginModel model);
  // Future<void> signUp(UserLoginModel model);
}

class GeneralService implements IService {
  Dio dio = Dio();
  @override
  int? statusCode;

  @override
  Future<void> postLogin(UserLoginModel model) async {
    final jsonModel = jsonEncode(model.toJson());
    final response = await dio.post(signIn, data: jsonModel);
    if (response.statusCode == 200) {
      statusCode = response.statusCode;
      print(response);
      return response.data;
    } else {
      return;
    }
  }

//   @override
//   Future<void> signUp(UserLoginModel model) {
//     // TODO: implement signUp
//     throw UnimplementedError();
//   }
}
