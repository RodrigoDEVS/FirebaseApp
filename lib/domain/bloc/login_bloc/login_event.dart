part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged({required this.email});
}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged({required this.password});
}

class ShowPassword extends LoginEvent {
  final bool showPassword;

  const ShowPassword({required this.showPassword});
}
