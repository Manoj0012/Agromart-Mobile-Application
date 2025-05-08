import 'package:another_flushbar/flushbar.dart';
import 'package:client/Presentation/Detailspage_ui.dart';
import 'package:client/Presentation/Homepage_ui.dart';
import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/Utiltis/Logo.dart';
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/bloc/Onboarding_bloc.dart';
import 'package:client/bloc/Onboarding_event.dart';
import 'package:client/bloc/Onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingUi extends StatefulWidget {
  const OnboardingUi({super.key});
  @override
  State<OnboardingUi> createState() => _OnboardingUiState();
}

class _OnboardingUiState extends State<OnboardingUi> {
  @override
  void initState() {
    super.initState();
    context.read<OnboardingBloc>().add(OnboardingInitalEvent());
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingProfileSet) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailspageUi(),
              ));
        }
        if (state is OnboardingSucess_state) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomepageUi(userdata: state.userdata),
              ));
        }
        if (state is OnboardingError_state) {
          Flushbar(
            message: state.msg,
            duration: const Duration(seconds: 4),
            backgroundColor: Color(utils.error_color),
          ).show(context);
        }
      },
      builder: (context, state) {
        if (state is OnboardingLoading_state) {
          return const Scaffold(
              body: BackgroundImage(
            child: Center(
              child: Logo(),
            ),
          ));
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            ),
          );
        }
      },
    );
  }
}
