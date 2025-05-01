// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/bloc/Login_event.dart';
import 'package:client/bloc/Login_state.dart';
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




