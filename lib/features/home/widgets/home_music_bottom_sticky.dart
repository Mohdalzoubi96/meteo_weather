import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meteo_weather/utils/constant/app_assets.dart';
import 'package:sizer/sizer.dart';

import '../../song_player/song_player.export.dart';
import '../home.export.dart';

class MusicBottomSticky extends StatelessWidget {
  const MusicBottomSticky({Key? key}) : super(key: key);

  MusicListModel get _defaultMusic => MusicListModel(
        musicName: 'Finally Found You',
        signerName: 'Alec Benjamin',
        musicTime: '4:12',
        isPlayed: true,
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final songStaticData =
            context.read<HomeBloc>().musicDataStatic.firstWhere(
                  (element) => element.isPlayed!,
                  orElse: () => _defaultMusic,
                );
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SongPlayerScreen(
                musicName: songStaticData.musicName!,
                signerName: songStaticData.signerName!,
                musicTime: songStaticData.musicTime!,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Color(0xFF66334c),
                    Color(0xFF20242b),
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                              image: AssetImage(
                                AppAssets.meteoLogo,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 8),
                        child: Text(
                          songStaticData.musicName ?? '',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.pause, color: Colors.white),
                      const Padding(
                        padding: EdgeInsetsDirectional.only(end: 5),
                        child: Icon(Icons.skip_next, color: Colors.white),
                      ),
                    ],
                  ),
                  BlocBuilder<PlayControllerBloc, PlayControllerState>(
                    builder: (context, state) {
                      return Container(
                        width: (context
                                    .read<PlayControllerBloc>()
                                    .globalCurrentTime *
                                20)
                            .w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: const Border(
                            bottom: BorderSide(
                              color: Color(0xFFd6457e),
                              width: 1.5,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
