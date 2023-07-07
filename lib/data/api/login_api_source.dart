import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc_app/domain/models/login_model.dart';

class LoginApiSource {
  final BuildContext context;

  LoginApiSource(this.context);

  Future signIn(LoginModel loginModel) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginModel.email!, password: loginModel.password!);
      if (credential.user == null) {}
      if (!credential.user!.emailVerified) {}

      var user = credential.user;

      if (user != null) {
        //usuario verificado en Firebase
      } else {
        //error al obtener el usuario de Firebase
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('El usuario no existe')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Password incorrecto')));
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Correo Inválido')));
      } else if (e.code == 'user-disabled') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Usuario Inactivo')));
      }
    }
  }
}
