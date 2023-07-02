part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String username;
  final String password;
  final bool showPassword;
  const LoginState(
      {this.username = '', this.password = '', this.showPassword = true});

  @override
  List<Object> get props => [username, password, showPassword];

  LoginState copyWith({
    String? username,
    String? password,
    bool? showPassword,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
