import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:client/features/Login/repos/repos.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool Switch = false;
  LoginBloc() : super(LoginInitial()) {
    on<LoginIntialEvent>(loginupNavigateEvent);
    on<SignupNavigateEvent>(signupNavigateEvent);
    on<LoginPassEyeOpenEvent>(loginPassEyeOpen);
    on<LoginPassEyeCloseEvent>(loginEyeClosestate);
  }

  FutureOr<void> loginupNavigateEvent(
      LoginIntialEvent event, Emitter<LoginState> emit) {
    emit(LoginInitialState());
  }

  FutureOr<void> signupNavigateEvent(
      SignupNavigateEvent event, Emitter<LoginState> emit) {
    emit(SignupSwitchstate());
  }

  FutureOr<void> loginPassEyeOpen(
      LoginPassEyeOpenEvent event, Emitter<LoginState> emit) {
    emit(LoginEyeOpenstate());
  }

  FutureOr<void> loginEyeClosestate(
      LoginPassEyeCloseEvent event, Emitter<LoginState> emit) {
    emit(LoginEyeClosestate());
  }
}
