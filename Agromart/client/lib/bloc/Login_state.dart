class LoginState {}

class LoginInitial_State extends LoginState {}

class LoginError_State extends LoginState {
  final String error_msg;
  final String fieldname;

  LoginError_State({required this.error_msg, required this.fieldname});
}

// ignore: camel_case_types
class LoginSucess_State extends LoginState {}