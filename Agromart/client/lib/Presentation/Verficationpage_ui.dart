import 'package:client/Presentation/Homepage_ui.dart';
import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/Presentation/widgets/VerficationResend.dart';
import 'package:client/Presentation/widgets/VerficationTitle.dart';
import 'package:client/bloc/Verfication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:another_flushbar/flushbar.dart';

class VerficationpageUi extends StatelessWidget {
  const VerficationpageUi({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    final TextEditingController pinController = TextEditingController();
    return BlocConsumer<VerficationBloc, VerficationState>(
      listener: (context, state) {
        if (state is verficationSucess_state) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomepageUi(),
              ));
        }
        if (state is VerificationProfileSet_state) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomepageUi(),
              ));
        }
        if (state is VerficationResend_state) {
          pinController.clear();
          Flushbar(
            message: "OTP Resent",
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.green,
          ).show(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: BackgroundImage(
              child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 100, 30, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Verficationtitle(gmail: "asss@gmail.com"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                PinCodeTextField(
                  length: 4,
                  appContext: context,
                  controller: pinController,
                  onCompleted: (value) {
                    context
                        .read<VerficationBloc>()
                        .add(VerficationOnsubmit_Event(otp: value));
                  },
                  keyboardType: TextInputType.number,
                  autoFocus: true,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 65,
                    fieldWidth: 70,
                    activeColor: Color(utils.Primary_color),
                    selectedColor: Color(utils.Primary_color),
                    inactiveColor: Colors.grey,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Verficationresend(
                  Onpressed: () {
                    context
                        .read<VerficationBloc>()
                        .add(VerficationResend_Event());
                  },
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
