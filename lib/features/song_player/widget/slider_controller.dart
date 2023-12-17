import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../song_player.export.dart';

class SliderController extends StatelessWidget {
  final double maxTime;
  final String musicTime;

  const SliderController({
    Key? key,
    required this.maxTime,
    required this.musicTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PlayControllerBloc>();
    return BlocBuilder<PlayControllerBloc, PlayControllerState>(
      builder: (context, state) {
        if (state is PlayControllerInitial) {
          return Padding(
            padding: EdgeInsets.only(top: 8.h, left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  state.currentValue.toStringAsFixed(2).replaceAll('.', ':'),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Slider(
                    activeColor: const Color(0xFFf75191),
                    inactiveColor: const Color(0xFF8d9298),
                    thumbColor: Colors.white,
                    value: state.currentValue,
                    min: 0.0,
                    max: maxTime,
                    onChanged: (double value) {
                      controller.add(
                        ChangeCurrentSliderPositionEvent(newValue: value),
                      );
                    },
                  ),
                ),
                Text(musicTime, style: const TextStyle(color: Colors.white)),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
