// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/bloc/Verfication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Verficationresend extends StatelessWidget {
  final VoidCallback Onpressed;
  const Verficationresend({
    super.key,
    required this.Onpressed,
  });

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Code must be filled in within 10min"),
          BlocBuilder<VerficationBloc, VerficationState>(
            builder: (context, state) {
              if (state is VerficationCount_state) {
                return Text(
                  " resend in ${state.secondLeft}",
                  style: TextStyle(
                      color: Color(utils.Secoundary_color), fontSize: 18),
                );
              }
              return TextButton(
                  onPressed: Onpressed,
                  child: Text(
                    "resend",
                    style: TextStyle(
                        color: Color(utils.Primary_color), fontSize: 18),
                  ));
            },
          )
        ],
      ),
    );
  }
}
