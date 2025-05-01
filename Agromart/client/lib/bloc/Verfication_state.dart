class VerficationState {}

class VerficationInitial extends VerficationState {}

class VerficationError_state extends VerficationState {
  final String errorMsg;
  VerficationError_state({required this.errorMsg});
}

class VerificationProfileSet_state extends VerficationState {}

class VerficationResend_state extends VerficationState {}

class verficationSucess_state extends VerficationState {}

class VerficationCount_state extends VerficationState {
  final int secondLeft;
  VerficationCount_state({required this.secondLeft});
}