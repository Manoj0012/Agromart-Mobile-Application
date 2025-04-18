import 'package:client/Presentation/Homepage_ui.dart';
import 'package:client/Presentation/Loginpage_ui.dart';
import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/Utiltis/Logo.dart';
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
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingSucess_state) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomepageUi(),
              ));
        }
        if (state is OnboardingReAuth_state) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginpageUi(),
              ));
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
