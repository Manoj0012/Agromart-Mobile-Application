class FieldState {}

class FieldInitial extends FieldState {}

class FieldError_State extends FieldState {
  final String fieldname;
  final String error_msg;
  FieldError_State({required this.fieldname, required this.error_msg});
}