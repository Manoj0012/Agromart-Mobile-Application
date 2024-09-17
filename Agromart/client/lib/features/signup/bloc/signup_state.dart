part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupActionState extends SignupState {}

final class SignupInitial extends SignupState {}

final class LoginInitialState extends SignupState {}


final class LoginSwitchstate extends SignupActionState {}

final class SignupSwitchstate extends SignupState {}