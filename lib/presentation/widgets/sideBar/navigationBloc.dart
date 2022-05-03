import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortloom/presentation/views/home/homeScreen.dart';

enum NavigationEvents { homeScreenClickedEvent, clientesScreenClickedEvent }

class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(const HomeScreen()) {
    on<NavigationEvents>((event, emit) {
      switch (event) {
        case NavigationEvents.homeScreenClickedEvent:
          emit(const HomeScreen());
          break;
      }
    });
  }
}
