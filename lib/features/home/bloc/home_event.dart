part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}


class ChangeSelectedItemHomeEvent extends HomeEvent {
  final int currentIndex;

  ChangeSelectedItemHomeEvent({required this.currentIndex});
}
