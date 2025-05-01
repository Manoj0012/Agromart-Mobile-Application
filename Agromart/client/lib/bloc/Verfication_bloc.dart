// ignore_for_file: camel_case_types
import 'package:client/bloc/Verfication_state.dart';
import 'package:client/bloc/Verification_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerficationBloc extends Bloc<VerficationEvent, VerficationState> {
  VerficationBloc() : super(VerficationInitial()) {
    // ignore: void_checks
    on<VerficationOnsubmit_Event>((event, emit) {
      final String val = event.otp.trim();
      if (val.length <= 3) {
        return VerficationError_state(errorMsg: "Verfication code must filled");
      }
      // emit(VerficationError_state(errorMsg: "invalid OTP"));
      emit(VerificationProfileSet_state());
      // emit(verficationSucess_state());
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
