part of 'play_controller_bloc.dart';

@immutable
abstract class PlayControllerState {}

class PlayControllerInitial extends PlayControllerState {

  PlayControllerInitial();
}

class RefreshState extends PlayControllerState {
  RefreshState();
}
