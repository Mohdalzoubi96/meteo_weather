import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../home.export.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<MusicListModel> musicDataStatic = [];

  void assignStaticData() {
    musicDataStatic = [
      MusicListModel(
          musicName: 'Bailando',
          signerName: 'Billy Ray Cyrus',
          musicTime: '3: 58',
          isPlayed: false),
      MusicListModel(
          musicName: 'Cuando Me Enamoron',
          signerName: 'Mabel',
          musicTime: '2:46',
          isPlayed: false),
      MusicListModel(
          musicName: 'Dirty Dancer',
          signerName: 'Alec Benjamin',
          musicTime: '4:12',
          isPlayed: false),
      MusicListModel(
          musicName: 'Finally Found You',
          signerName: 'Alec Benjamin',
          musicTime: '4:12',
          isPlayed: true),
      MusicListModel(
          musicName: 'Heart Attack',
          signerName: 'Bazzi',
          musicTime: '3:12',
          isPlayed: false),
      MusicListModel(
          musicName: 'Heartbeat',
          signerName: 'Jonas Brothers',
          musicTime: '3:56',
          isPlayed: false),
      MusicListModel(
          musicName: 'Hero',
          signerName: 'BLACKPINK',
          musicTime: '2:47',
          isPlayed: false),
      MusicListModel(
          musicName: 'Move To Miami',
          signerName: 'BLACKPINK',
          musicTime: '2:47',
          isPlayed: false),
      MusicListModel(
          musicName: 'Heart Attack2',
          signerName: 'Bazzi',
          musicTime: '3:12',
          isPlayed: false),
      MusicListModel(
          musicName: 'Heartbeat1',
          signerName: 'Jonas Brothers',
          musicTime: '3:56',
          isPlayed: false),
      MusicListModel(
          musicName: 'Hero1',
          signerName: 'BLACKPINK',
          musicTime: '2:47',
          isPlayed: false),
      MusicListModel(
          musicName: 'Move To Miami1',
          signerName: 'BLACKPINK',
          musicTime: '2:47',
          isPlayed: false),
      MusicListModel(
          musicName: 'Heart Attack1',
          signerName: 'Bazzi',
          musicTime: '3:12',
          isPlayed: false),
      MusicListModel(
          musicName: 'Heartbeat2',
          signerName: 'Jonas Brothers',
          musicTime: '3:56',
          isPlayed: false),
      MusicListModel(
          musicName: 'Hero2',
          signerName: 'BLACKPINK',
          musicTime: '2:47',
          isPlayed: false),
      MusicListModel(
          musicName: 'Move To Miami2',
          signerName: 'BLACKPINK',
          musicTime: '2:47',
          isPlayed: false),
    ];
  }

  HomeBloc() : super(const HomeInitial(0)) {
    assignStaticData();
    on<HomeEvent>((event, emit) {
      if (event is ChangeSelectedItemHomeEvent) {
        switch (event.currentIndex) {
          case 0:
            emit(HomeMusicListState(event.currentIndex));
            break;
          case 1:
            emit(HomeSearchListState(event.currentIndex));
            break;
          case 3:
            emit(HomePodcastListState(event.currentIndex));
            break;
          case 4:
            emit(HomeSettingListState(event.currentIndex));
            break;
        }
      }

      if (event is ChangeSongEvent) {
        final currentPlayed = musicDataStatic.firstWhere(
          (element) => element.isPlayed!,
          orElse: () => MusicListModel(
            musicName: 'Finally Found You',
            signerName: 'Alec Benjamin',
            musicTime: '4:12',
            isPlayed: true,
          ),
        );

        currentPlayed.isPlayed = false;

        final indexNewPlayed = musicDataStatic.indexWhere(
            (element) => element.musicName == event.currentSong.musicName);

        if(indexNewPlayed != -1){
          musicDataStatic[indexNewPlayed].isPlayed = true;
        }

        emit(HomeRefreshState(state.index));
      }
    });
  }
}
