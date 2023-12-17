part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final int index;
  const HomeState(this.index);
}

class HomeInitial extends HomeState {
  const HomeInitial(super.index);
}

class HomeMusicListState extends HomeState {
  const HomeMusicListState(super.index);
}

class HomeSearchListState extends HomeState {
  const HomeSearchListState(super.index);
}

class HomePodcastListState extends HomeState {
  const HomePodcastListState(super.index);
}

class HomeSettingListState extends HomeState {
  const HomeSettingListState(super.index);
}
