import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingInitalevent>(onboardinitevent);
  }

  FutureOr<void> onboardinitevent(
    OnboardingInitalevent event, Emitter<OnboardingState> emit) async {
    bool valid = false;
    emit(OnboardingLoadingstate());
    await Future.delayed(const Duration(seconds: 3));
    if (valid) {
      emit(OnboardingSuccessstate());
    } else  {
      emit(OnboardingInvalidstate());
    }
  }
}
