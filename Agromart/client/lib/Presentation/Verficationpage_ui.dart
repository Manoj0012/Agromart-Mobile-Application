import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/Presentation/widgets/VerficationTitle.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerficationpageUi extends StatelessWidget {
  const VerficationpageUi({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
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
              onCompleted: (value) {
                print("OTP Entered: $value");
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
          ],
        ),
      )),
    );
  }
}
