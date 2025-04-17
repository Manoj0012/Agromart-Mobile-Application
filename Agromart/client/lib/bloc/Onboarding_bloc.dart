import 'package:client/bloc/Onboarding_event.dart';
import 'package:client/bloc/Onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingLoading_state()) {
    on<OnboardingInitalEvent>((event, emit) async {
      emit(OnboardingLoading_state());
      await Future.delayed(const Duration(seconds: 2));
      emit(OnboardingSucess_state());
    });
  }
}




