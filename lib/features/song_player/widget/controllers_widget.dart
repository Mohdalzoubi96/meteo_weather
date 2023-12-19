import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../song_player.export.dart';

class ControllersWidget extends StatelessWidget {
  final double musicTime;
  const ControllersWidget({Key? key, required this.musicTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _iconWidget(iconData: CupertinoIcons.backward_end_fill),
          _iconWidget(iconData: CupertinoIcons.backward_fill),
          _buildPlayOrResumeIcon(context),
          _iconWidget(iconData: CupertinoIcons.forward_end_fill),
          _iconWidget(iconData: CupertinoIcons.forward_fill),
        ],
      ),
    );
  }

  Widget _iconWidget({required IconData iconData}) {
    return Icon(iconData, color: Colors.white);
  }

  Widget _buildPlayOrResumeIcon(BuildContext context) {
    final controller = context.read<PlayControllerBloc>();
    return BlocBuilder<PlayControllerBloc, PlayControllerState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(
            child: IconButton(
              icon: controller.isPlay ? const Icon(Icons.pause, color: Color(0xFF192229), size: 60) : const Icon(Icons.play_arrow, color: Color(0xFF192229), size: 60),
              onPressed: () => controller.add(PlayOrStopEvent(musicTime: musicTime, currentTime: context.read<PlayControllerBloc>().globalCurrentTime)),
            ),
          ),
        );
      },
    );
  }
}
