part of 'welcome_bloc.dart';

abstract class WelcomeState extends Equatable {
  final int index;
  const WelcomeState({required this.index});

  @override
  List<Object> get props => [index];
}

class WelcomeInitial extends WelcomeState {
  const WelcomeInitial() : super(index: 0);
}

class WelcomeSetState extends WelcomeState {
  final int newIndex;
  const WelcomeSetState({required this.newIndex}) : super(index: newIndex);
}
