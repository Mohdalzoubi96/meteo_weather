import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_controller_event.dart';

part 'play_controller_state.dart';

class PlayControllerBloc
    extends Bloc<PlayControllerEvent, PlayControllerState> {
  bool isPlay = false;
  double globalCurrentTime = 0.0;
  Timer? _timer;

  PlayControllerBloc() : super(PlayControllerInitial()) {
    on<PlayControllerEvent>((event, emit) async {
      if (event is ChangeCurrentSliderPositionEvent) {
        if(event.newValue >= 0.60 && event.newValue <= 1.00){
          globalCurrentTime = 1.00;
        } else if(event.newValue >= 1.60 && event.newValue <= 2.00){
          globalCurrentTime = 2.00;
        } else if(event.newValue >= 2.60 && event.newValue <= 3.00){
          globalCurrentTime = 3.00;
        } else if(event.newValue >= 3.60 && event.newValue <= 4.00){
          globalCurrentTime = 4.00;
        } else if(event.newValue >= 4.60 && event.newValue <= 5.00){
          globalCurrentTime = 5.00;
        } else{
          globalCurrentTime = event.newValue;
        }

        emit(RefreshState());
        emit(PlayControllerInitial());
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
    emit(PlayControllerInitial());
  }

  Future<void> _startCountMusic(
    PlayOrStopEvent event,
    Emitter<PlayControllerState> emit,
  ) async {
    isPlay = !isPlay;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (!isPlay){
        timer.cancel();
        add(EmitANewTimerEvent(newValue: globalCurrentTime));
      } else{
        globalCurrentTime += 0.01;
        if (double.parse(globalCurrentTime.toStringAsFixed(2)) == 0.60) {
          globalCurrentTime = 1.00;
        } else if (double.parse(globalCurrentTime.toStringAsFixed(2)) == 1.60) {
          globalCurrentTime = 2.00;
        } else if (double.parse(globalCurrentTime.toStringAsFixed(2)) == 2.60) {
          globalCurrentTime = 3.00;
        } else if (double.parse(globalCurrentTime.toStringAsFixed(2)) == 3.60) {
          globalCurrentTime = 4.00;
        } else if (double.parse(globalCurrentTime.toStringAsFixed(2)) == 4.60) {
          globalCurrentTime = 5.00;
        }
        _addNewTimerEvent(globalCurrentTime, emit);
        if (double.parse(globalCurrentTime.toStringAsFixed(2)) == event.musicTime) {
          globalCurrentTime = 0.0;
          timer.cancel();
          isPlay = !isPlay;
        }
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
