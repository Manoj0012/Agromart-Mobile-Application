// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial_State()) {
    on<LoginSubmit_Event>((event, emit) {
      String val = event.email.trim();

      final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
      if (val.isEmpty) {
        return emit(LoginError_State(
            fieldname: "email", error_msg: "Email must be filled"));
      } else if (!emailRegex.hasMatch(val)) {
        return emit(LoginError_State(
            fieldname: "email", error_msg: "Enter valid email"));
      }
      emit(LoginSucess_State());
    });
  }
}

class LoginState {}

class LoginInitial_State extends LoginState {}

class LoginError_State extends LoginState {
  final String error_msg;
  final String fieldname;

  LoginError_State({required this.error_msg, required this.fieldname});
}

class LoginSucess_State extends LoginState {}

class LoginEvent {}

class LoginSubmit_Event extends LoginEvent {
  final String email;
  LoginSubmit_Event({
    required this.email,
  });
}
