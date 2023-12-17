import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_controller_event.dart';

part 'play_controller_state.dart';

class PlayControllerBloc
    extends Bloc<PlayControllerEvent, PlayControllerState> {
  bool isPlay = false;

  PlayControllerBloc() : super(PlayControllerInitial(currentValue: 0)) {
    on<PlayControllerEvent>((event, emit) async {
      if (event is ChangeCurrentSliderPositionEvent) {
        emit(RefreshState());
        emit(PlayControllerInitial(currentValue: event.newValue));
      }
    });

    on<PlayOrStopEvent>(
        (event, emit) async => await _startCountMusic(event, emit));

    on<EmitANewTimerEvent>(
        (event, emit) async => await _emitANewTimer(event, emit));
  }

  Future<void> _emitANewTimer(
    EmitANewTimerEvent event,
    Emitter<PlayControllerState> emit,
  ) async {
    emit(RefreshState());
    emit(PlayControllerInitial(currentValue: event.newValue));
  }

  Future<void> _startCountMusic(
    PlayOrStopEvent event,
    Emitter<PlayControllerState> emit,
  ) async {
    isPlay = !isPlay;
    double totalTime = event.musicTime * 60;

    /// Total time in seconds
    double currentTime = (state as PlayControllerInitial).currentValue;

    /// Current time counter
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (!isPlay) {
        timer.cancel();
        add(EmitANewTimerEvent(newValue: 0));
        return;
      } else {
        currentTime++;
      }

      /// Check if the current time is within the totalTime window
      if (currentTime <= totalTime) {
        int seconds = currentTime.toInt();
        Duration duration = Duration(seconds: seconds);

        String formattedDuration =
            '${duration.inMinutes}:${(duration.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';

        await _addNewTimerEvent(
          double.parse(
            formattedDuration.replaceAll(':', '.'),
          ),
          emit,
        );
      } else {
        /// Stop the timer when the totalTime is over
        timer.cancel();
      }
    });
  }

  Future<void> _addNewTimerEvent(
    double currentTime,
    Emitter<PlayControllerState> emit,
  ) async {
    try {
      add(EmitANewTimerEvent(newValue: currentTime));
    } catch (exception) {
      log('ERROR => ${exception.toString()}');
    }
  }
}
