import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/data/api/login_api_source.dart';
import 'package:flutter_bloc_app/domain/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_bloc_app/domain/models/login_model.dart';

class LoginRepository {
  final BuildContext context;

  const LoginRepository({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<LoginBloc>().state;
        LoginModel loginModel =
            LoginModel(email: state.username, password: state.password);
        if (loginModel.email!.isEmpty) {
          throw Exception('Email is empty');
        }
        if (loginModel.password!.isEmpty) {
          throw Exception('Password is empty');
        }
        await LoginApiSource(context).signIn(loginModel);
      }
    } catch (e) {
      print(e);
    }
  }
}
