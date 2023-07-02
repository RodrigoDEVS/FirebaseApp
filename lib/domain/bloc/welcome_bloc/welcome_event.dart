part of 'welcome_bloc.dart';

abstract class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => [];
}

class ChangePage extends WelcomeEvent {
  final int index;

  const ChangePage({required this.index});
}
