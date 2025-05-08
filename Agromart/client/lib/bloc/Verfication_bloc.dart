// ignore_for_file: camel_case_types
import 'package:client/bloc/Verfication_state.dart';
import 'package:client/bloc/Verification_event.dart';
import 'package:client/Repo/Auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerficationBloc extends Bloc<VerficationEvent, VerficationState> {
  VerficationBloc() : super(VerficationInitial()) {
    // ignore: void_checks
    on<VerficationOnsubmit_Event>((event, emit) async {
      final String val = event.otp.trim();
      final String? email = event.email;
      if (val.length <= 3) {
        return emit(
            VerficationError_state(errorMsg: "Verfication code must filled"));
      }
      if (email != null) {
        var res = await AuthRepo.AuthVerfication(email, val);
        var verfied = res['verified'];
        if (res!=null && verfied!=false) {
          return emit(verficationSucess_state());
        }
        return emit(VerificationProfileSet_state());
      }
    });
    on<VerficationResend_Event>(
      (event, emit) async {
        emit(VerficationResend_state());
        for (int i = 30; i >= 0; i--) {
          emit(VerficationCount_state(secondLeft: i));
          await Future.delayed(const Duration(seconds: 1));
        }
        emit(VerficationInitial());
      },
    );
  }
}
