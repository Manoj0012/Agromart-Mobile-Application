import 'package:bloc/bloc.dart';
import 'package:client/features/Login/ui/Login_page.dart';
import 'package:client/features/home/ui/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
    onboardbloc.add(OnboardingInitalevent());
  }

  final OnboardingBloc onboardbloc = OnboardingBloc();
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      bloc: onboardbloc,
      listenWhen: (previous, current) => current is OnboardingActionState,
      buildWhen: (previous, current) => current is! OnboardingActionState,
      listener: (context, state) {
        if (state is OnboardingInvalidstate) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginPage()));
        } else if (state is OnboardingSuccessstate) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Homepage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case OnboardingLoadingstate:
            return Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Onboarding.png"),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          width: 220,
                          height: 100,
                          image: AssetImage('assets/images/farmbuy.png')),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "We make online selling superbly easy",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFFF09051C)),
                      )
                    ],
                  ),
                ),
              ),
            );
          case OnboardingSuccessstate:
            return Scaffold(
              body: Center(
                child: Text("sucess state"),
              ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
