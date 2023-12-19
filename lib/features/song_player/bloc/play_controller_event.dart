part of 'play_controller_bloc.dart';

@immutable
abstract class PlayControllerEvent {}

class ChangeCurrentSliderPositionEvent extends PlayControllerEvent {
  final double newValue;

  ChangeCurrentSliderPositionEvent({required this.newValue});
}

class PlayOrStopEvent extends PlayControllerEvent {
  final double musicTime;
  final double currentTime;

  PlayOrStopEvent({required this.musicTime, required this.currentTime});
}

class EmitANewTimerEvent extends PlayControllerEvent {
  final double newValue;

  EmitANewTimerEvent({required this.newValue});
}
