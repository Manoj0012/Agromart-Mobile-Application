import 'package:client/Presentation/Onboarding_ui.dart';
import 'package:client/bloc/Onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => OnboardingBloc(),
        child: const OnboardingUi(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
