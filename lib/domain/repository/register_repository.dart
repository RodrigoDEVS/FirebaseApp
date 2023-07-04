import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/domain/bloc/register_bloc/register_bloc.dart';

class RegisterRepository {
  final BuildContext context;

  RegisterRepository({required this.context});

  Future<void> handleRegister() async {
    final state = context.read<RegisterBloc>().state;

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: state.email, password: state.password);
    } on FirebaseAuthException catch (e) {
      print('el error: ${e.code}');
    }
  }
}
