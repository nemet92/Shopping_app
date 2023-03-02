class PasswordResetModel {
  String? kind;
  String? email;

  PasswordResetModel({this.kind, this.email});

  PasswordResetModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['email'] = email;
    return data;
  }
}
