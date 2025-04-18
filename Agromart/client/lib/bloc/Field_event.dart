class FieldEvent {}

class FieldError_Event extends FieldEvent {
  final String fieldname;
  final String error_msg;
  FieldError_Event({required this.fieldname, required this.error_msg});
}