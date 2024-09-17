part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginActionstate extends LoginState {}

final class LoginInitialState extends LoginState {}

final class SignupSwitchstate extends LoginActionstate {}


final class LoginEyeOpenstate extends LoginActionstate {
}

final class LoginEyeClosestate extends LoginActionstate {}
