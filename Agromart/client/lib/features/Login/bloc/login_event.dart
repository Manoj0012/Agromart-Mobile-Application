part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginIntialEvent extends LoginEvent {}

class SignupNavigateEvent extends LoginEvent {}

class LoginSubmitEvent extends LoginEvent {}

