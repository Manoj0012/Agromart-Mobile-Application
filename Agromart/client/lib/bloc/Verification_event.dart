class VerficationEvent {}

class VerficationOnsubmit_Event extends VerficationEvent {
  final String otp;
  VerficationOnsubmit_Event({required this.otp});
}

class VerficationResend_Event extends VerficationEvent {}