import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/domain/bloc/login_bloc/login_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  final BuildContext context;

  const LoginController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        //es lo mismo que usar BlocProvider.of<LoginBloc>(context).state;
        final state = context.read<LoginBloc>().state;
        String email = state.username;
        String password = state.password;
        if (email.isEmpty) {
          throw Exception('Email is empty');
        }
        if (password.isEmpty) {
          throw Exception('Password is empty');
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (credential.user == null) {}
          if (!credential.user!.emailVerified) {}

          var user = credential.user;

          if (user != null) {
            //usuario verificado en Firebase
            print('logueado correctamente');
          } else {
            //error al obtener el usuario de Firebase
          }
        } on FirebaseAuthException catch (e) {
          print('el error: ${e.code}');
          if (e.code == 'user-not-found') {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('El usuario no existe')));
          } else if (e.code == 'wrong-password') {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Password incorrecto')));
          } else if (e.code == 'invalid-email') {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Correo Inválido')));
          } else if (e.code == 'user-disabled') {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Usuario Inactivo')));
          }
        }
      }
    } catch (e) {
      print('error: $e');
    }
  }
}
