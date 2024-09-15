part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

sealed class OnboardingActionState extends OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

class OnboardingLoadingstate extends OnboardingState {}

class OnboardingErrorsstate extends OnboardingState {}

class OnboardingSuccessstate extends OnboardingActionState {}

class OnboardingInvalidstate extends OnboardingActionState {}
