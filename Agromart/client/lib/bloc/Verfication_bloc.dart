// ignore_for_file: camel_case_types
import 'package:flutter_bloc/flutter_bloc.dart';

class VerficationBloc extends Bloc<VerficationEvent, VerficationState> {
  VerficationBloc() : super(VerficationInitial()) {
    // ignore: void_checks
    on<VerficationOnsubmit_Event>((event, emit) {
      final String val = event.otp.trim();
      if (val.length <= 3) {
        return VerficationError_state(errorMsg: "Verfication code must filled");
      }
      emit(verficationSucess_state());
    });
    on<VerficationResend_Event>(
      (event, emit) async {
        emit(VerficationResend_state());
        for (int i = 30; i >= 0; i--) {
          emit(VerficationCount_state(secondLeft: i));
          await Future.delayed(Duration(seconds: 1));
        }
        emit(VerficationInitial());
      },
    );
  }
}

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

class VerficationEvent {}

class VerficationOnsubmit_Event extends VerficationEvent {
  final String otp;
  VerficationOnsubmit_Event({required this.otp});
}

class VerficationResend_Event extends VerficationEvent {}
