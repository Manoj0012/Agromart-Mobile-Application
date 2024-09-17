import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupIntialEvent>(signupSwitchstate);
    on<LoginNavigateEvent>(loginSwitchstate);
  }

  FutureOr<void> signupSwitchstate(
      SignupIntialEvent event, Emitter<SignupState> emit) {
    emit(SignupSwitchstate());
  }

  FutureOr<void> loginSwitchstate(
      LoginNavigateEvent event, Emitter<SignupState> emit) {
    emit(LoginSwitchstate());
  }
}
