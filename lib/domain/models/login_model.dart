// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

class LoginModel {
  String? email;
  String? password;
  bool? returnSecureToken;

  LoginModel({
    this.email,
    this.password,
    this.returnSecureToken = true,
  });

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        password: json["password"],
        returnSecureToken: json["returnSecureToken"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "returnSecureToken": returnSecureToken,
      };
}
