import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortloom/presentation/views/home/homeScreen.dart';
import 'package:fortloom/presentation/views/posts/postScreen.dart';

enum NavigationEvents { homeScreenClickedEvent, postScreenClickedEvent }

class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(const HomeScreen()) {
    on<NavigationEvents>((event, emit) {
      switch (event) {
        case NavigationEvents.homeScreenClickedEvent:
          emit(const HomeScreen());
          break;
        case NavigationEvents.postScreenClickedEvent:
          emit(PostScreen());
          break;
      }
    });
  }
}
