import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<ConfirmPasswordChanged>(_confirmPasswordChanged);
    on<ShowPassword>(_showPassword);
    on<ShowConfirmPassword>(_showConfirmPassword);
  }

  void _emailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordChanged(
      ConfirmPasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _showPassword(ShowPassword event, Emitter<RegisterState> emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void _showConfirmPassword(
      ShowConfirmPassword event, Emitter<RegisterState> emit) {
    emit(state.copyWith(showConfirmPassword: !state.showConfirmPassword));
  }
}
