part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}

final class NavigationHomeState extends NavigationState {}

final class NavigationLibraryState extends NavigationState {}

final class NavigationProfileState extends NavigationState {}

final class NavigationPlaySongState extends NavigationState {
  final Song song;

  NavigationPlaySongState({required this.song});
}
