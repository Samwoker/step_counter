import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/pages/signin/bloc/sign_in_events.dart';
import 'package:step_counter/pages/signin/bloc/sign_in_states.dart';

class SignInBlocs extends Bloc<SignInEvents, SignInStates> {
  SignInBlocs() : super(const SignInStates()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInStates> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInStates> emit) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }
}
