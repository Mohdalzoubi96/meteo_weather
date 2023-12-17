part of 'play_controller_bloc.dart';

@immutable
abstract class PlayControllerEvent {}

class ChangeCurrentSliderPositionEvent extends PlayControllerEvent {
  final double newValue;

  ChangeCurrentSliderPositionEvent({required this.newValue});
}

class PlayOrStopEvent extends PlayControllerEvent {
  final double musicTime;

  PlayOrStopEvent({required this.musicTime});
}

class EmitANewTimerEvent extends PlayControllerEvent {
  final double newValue;

  EmitANewTimerEvent({required this.newValue});
}
