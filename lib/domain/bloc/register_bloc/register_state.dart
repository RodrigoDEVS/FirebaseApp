part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final String email;
  final String password;
  final String confirmPassword;
  final bool showPassword;
  final bool showConfirmPassword;
  const RegisterState(
      {this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.showPassword = true,
      this.showConfirmPassword = true});

  @override
  List<Object> get props =>
      [email, password, confirmPassword, showPassword, showConfirmPassword];

  RegisterState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    bool? showPassword,
    bool? showConfirmPassword,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      showPassword: showPassword ?? this.showPassword,
      showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
    );
  }
}
