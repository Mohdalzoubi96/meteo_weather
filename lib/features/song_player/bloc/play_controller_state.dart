part of 'play_controller_bloc.dart';

@immutable
abstract class PlayControllerState {}

class PlayControllerInitial extends PlayControllerState {
  final double currentValue;

  PlayControllerInitial({required this.currentValue});
}

class RefreshState extends PlayControllerState {
  RefreshState();
}
