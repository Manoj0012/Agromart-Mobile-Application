import 'package:client/bloc/Onboarding_event.dart';
import 'package:client/bloc/Onboarding_state.dart';
import 'package:client/Repo/Auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingLoading_state()) {
    on<OnboardingInitalEvent>((event, emit) async {
      try {
        emit(OnboardingLoading_state());
        final data = await AuthRepo.AuthOnboarding();
        if (data != false) {
          final userVerified = data['user']['Usercredentials']['verified'];
          if (!userVerified) {
            return emit(OnboardingProfileSet());
          }
          await Future.delayed(const Duration(seconds: 2));
          return emit(OnboardingSucess_state(
              userdata: data['user']['userdata']['Firstname']));
        }
      } catch (error) {
        return emit(OnboardingError_state(msg: "Internal Server Error"));
      }
    });

    on<OnboardingReAuth_Event>(
      (event, emit) => emit(OnboardingReAuth_state()),
    );
  }
}
