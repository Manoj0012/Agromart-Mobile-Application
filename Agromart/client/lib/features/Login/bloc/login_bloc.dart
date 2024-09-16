import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginIntialEvent>(loginupNavigateEvent);
    on<SignupNavigateEvent>(signupNavigateEvent);
  }

  FutureOr<void> loginupNavigateEvent(
      LoginIntialEvent event, Emitter<LoginState> emit) {
    emit(LoginInitialState());
  }

  FutureOr<void> signupNavigateEvent(
      SignupNavigateEvent event, Emitter<LoginState> emit) {
    emit(SignupSwitchstate());
  }
}
