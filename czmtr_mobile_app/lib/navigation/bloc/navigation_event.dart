part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

final class NavigationToHomeEvent extends NavigationEvent {}

final class NavigationToLibraryEvent extends NavigationEvent {}

final class NavigationToProfileEvent extends NavigationEvent {}

final class NavigationToPlaySongEvent extends NavigationEvent {
  final Song song;

  NavigationToPlaySongEvent({required this.song});
}
