part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends RegisterEvent {
  final String email;
  const EmailChanged({required this.email});
}

class PasswordChanged extends RegisterEvent {
  final String password;
  const PasswordChanged({required this.password});
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;
  const ConfirmPasswordChanged({required this.confirmPassword});
}

class ShowPassword extends RegisterEvent {
  final bool showPassword;
  const ShowPassword({required this.showPassword});
}

class ShowConfirmPassword extends RegisterEvent {
  final bool showConfirmPassword;
  const ShowConfirmPassword({required this.showConfirmPassword});
}
