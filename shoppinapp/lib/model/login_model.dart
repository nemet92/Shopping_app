class UserLoginModel {
  String? email;
  String? password;
  bool? refreshToken;

  UserLoginModel({this.email, this.password, this.refreshToken});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
