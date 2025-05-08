class FieldState {}

class FieldInitial extends FieldState {
  final String fieldname;

  FieldInitial({required this.fieldname});
}

class FieldError_State extends FieldState {
  final String fieldname;
  final String error_msg;
  FieldError_State({required this.fieldname, required this.error_msg});
}
