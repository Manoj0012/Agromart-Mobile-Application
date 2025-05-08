class LoginEvent {}

// ignore: camel_case_types
class LoginSubmit_Event extends LoginEvent {
  final String email;
  LoginSubmit_Event({
    required this.email,
  });
}