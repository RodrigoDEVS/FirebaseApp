import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/domain/repository/login_repository.dart';

class LoginUseCase {
  final BuildContext context;

  LoginUseCase(this.context);

  Future logIn(String email) async {
    return LoginRepository(context: context).handleSignIn(email);
  }
}
