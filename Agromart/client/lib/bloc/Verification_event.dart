class VerficationEvent {}

class VerficationOnsubmit_Event extends VerficationEvent {
  final String otp;
  final String? email;

  VerficationOnsubmit_Event({required this.otp, required this.email});
}

class VerficationResend_Event extends VerficationEvent {}
