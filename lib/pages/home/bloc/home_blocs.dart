import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/pages/home/bloc/home_events.dart';
import 'package:step_counter/pages/home/bloc/home_states.dart';

class HomeBlocs extends Bloc<HomeEvents, HomeStates> {
  HomeBlocs() : super(HomeStates()) {
    on<TriggerHomeEvent>((event, emit) {
      emit(HomeStates(index: event.index));
    });
  }
}
