import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/pages/sign_up/bloc/sign_up_events.dart';
import 'package:step_counter/pages/sign_up/bloc/sign_up_states.dart';

class SignUpBlocs extends Bloc<SignUpEvents, SignUpStates> {
  SignUpBlocs() : super(const SignUpStates()) {
    on<UsernameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }
  void _usernameEvent(UsernameEvent event, Emitter<SignUpStates> emit) {
    print(event.username);
    emit(state.copyWith(username: event.username));
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpStates> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpStates> emit) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(
    ConfirmPasswordEvent event,
    Emitter<SignUpStates> emit,
  ) {
    print(event.confirmPassword);
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
