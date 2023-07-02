import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(const WelcomeInitial()) {
    on<ChangePage>((event, emit) {
      print('se activo el evento: ${event.index}');
      emit(WelcomeSetState(newIndex: event.index));
      print('el index: ${state.index}');
    });
  }
}
