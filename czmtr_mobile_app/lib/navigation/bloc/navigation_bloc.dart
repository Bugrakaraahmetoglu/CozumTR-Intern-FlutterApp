import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:czmtr_mobile_app/model/Song.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationToHomeEvent>(navigationToHomeEvent);
    on<NavigationToLibraryEvent>(navigationToLibraryEvent);
    on<NavigationToProfileEvent>(navigationToProfileEvent);
    on<NavigationToPlaySongEvent>(navigationToPlaySongEvent);
  }

  void navigationToHomeEvent(NavigationToHomeEvent event, Emitter<NavigationState> emit) {
    emit(NavigationHomeState());
  }

  void navigationToLibraryEvent(NavigationToLibraryEvent event, Emitter<NavigationState> emit) {
    emit(NavigationLibraryState());
  }

  void navigationToProfileEvent(NavigationToProfileEvent event, Emitter<NavigationState> emit) {
    emit(NavigationProfileState());
  }

  void navigationToPlaySongEvent(NavigationToPlaySongEvent event, Emitter<NavigationState> emit) {
    emit(NavigationPlaySongState(song: event.song));
  }
}
