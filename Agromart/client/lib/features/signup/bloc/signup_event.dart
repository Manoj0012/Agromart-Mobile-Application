part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignupIntialEvent extends SignupEvent {}

class LoginNavigateEvent extends SignupEvent {}

class SignupSubmitEvent extends SignupEvent {}