class OnboardingState {}

class OnboardingLoading_state extends OnboardingState {}

class OnboardingReAuth_state extends OnboardingState {}

class OnboardingSucess_state extends OnboardingState {
  final dynamic userdata;
  OnboardingSucess_state({required this.userdata});
}

class OnboardingError_state extends OnboardingState {
  final String msg;
  OnboardingError_state({required this.msg});
}

class OnboardingProfileSet extends OnboardingState{}
