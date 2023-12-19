import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meteo_weather/features/feature.export.dart';
import 'package:meteo_weather/utils/theme/light_theme.dart';

class HomeMusicItems extends StatelessWidget {
  const HomeMusicItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212a32),
      bottomNavigationBar: const MusicBottomSticky(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'ALL SONGS',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 10),
            child: Icon(Icons.search, color: Colors.white),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: context.read<HomeBloc>().musicDataStatic.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final currentSong = context.read<HomeBloc>().musicDataStatic[index];
          return _buildMusicContent(currentSong, context);
        },
      ),
    );
  }

  void _onSongPressed(BuildContext context, MusicListModel currentSong) {
    context.read<HomeBloc>().add(ChangeSongEvent(currentSong: currentSong));
    context.read<PlayControllerBloc>().globalCurrentTime = 0.0;
    context.read<PlayControllerBloc>().isPlay = false;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => SongPlayerScreen(
                  musicName: currentSong.musicName!,
                  signerName: currentSong.signerName!,
                  musicTime: currentSong.musicTime!,
                )));
  }

  Widget _buildMusicContent(
    MusicListModel currentSong,
    BuildContext context,
  ) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: currentSong.isPlayed! ? Colors.white.withOpacity(.2) : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () => _onSongPressed(context, currentSong),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: currentSong.isPlayed!
                    ? LightTheme.of(context).secondaryColor
                    : Colors.white,
                child: Icon(
                  currentSong.isPlayed! ? Icons.pause : Icons.play_arrow,
                  color: currentSong.isPlayed!
                      ? Colors.white
                      : LightTheme.of(context).secondaryColor,
                ),
              ),
              title: _commonTextBody(currentSong.musicName!),
              subtitle: _commonTextBody(currentSong.signerName!),
              trailing: _commonTextBody(currentSong.musicTime!),
            ),
          ),
        );
      },
    );
  }

  Widget _commonTextBody(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }
}
