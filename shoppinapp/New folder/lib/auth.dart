import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  String? _token;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.https(
        "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyDTV_cN4k-Abrjwdtuli47KNgA4WW3Mzaw");
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    final responseData = json.decode(response.body);
    print(responseData);
    _token = responseData['idToken'];
    print('************************$_token');
    try {
      if (urlSegment == "signUp") {
        sharedPreferences.setString("token", _token.toString());
      }
    } catch (e) {
      print(e);
    }
    print("true");
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  Future<void> changePassword(String newPassword) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
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
