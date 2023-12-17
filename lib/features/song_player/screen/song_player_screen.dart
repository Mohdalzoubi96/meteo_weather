import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/utils.export.dart';
import '../song_player.export.dart';

class SongPlayerScreen extends StatelessWidget {
  final String musicName;
  final String signerName;
  final String musicTime;

  const SongPlayerScreen({
    Key? key,
    required this.musicName,
    required this.signerName,
    required this.musicTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxTime =
        double.parse(musicTime.replaceAll(':', '.').replaceAll(' ', '').trim());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF33373a),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => CustomNavigator.pop(),
        ),
        title: const Text('NOW PLAYING', style: TextStyle(color: Colors.white)),
        actions: const [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 10),
            child: Icon(Icons.search, color: Colors.white),
          )
        ],
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFF33373a),
              Color(0xFF19202a),
              Color(0xFF2e2d35),
            ],
          ),
        ),
        child: Column(
          children: [
            Image.asset(AppAssets.songBackground),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(),
                FilledAppButton(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: Text(
                musicName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Text(
                signerName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            _buildSliderMusicWidget(maxTime),
            ControllersWidget(
              musicTime: double.parse(
                musicTime.replaceAll(':', '.').replaceAll(' ', '').trim(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderMusicWidget(double maxTime) {
    return SliderController(
      maxTime: maxTime,
      musicTime: musicTime,
    );
  }
}
