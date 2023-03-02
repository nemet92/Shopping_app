import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  String? _token;

  Future<void> changePassword(String newPassword) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(newPassword);
    _token = sharedPreferences.getString("token");
    var url = Uri.https(
        "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyDTV_cN4k-Abrjwdtuli47KNgA4WW3Mzaw");
    try {
      await http.post(
        url,
        body: json.encode(
          {
            'idToken': _token,
            'password': newPassword,
            'returnSecureToken': true,
          },
        ),
      );
    } catch (error) {
      rethrow;
    }
  }
}
