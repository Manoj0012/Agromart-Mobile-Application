import 'package:client/Presentation/Onboarding_ui.dart';
import 'package:client/bloc/Field_bloc.dart';
import 'package:client/bloc/Login_bloc.dart';
import 'package:client/bloc/Onboarding_bloc.dart';
import 'package:client/bloc/Verfication_bloc.dart';
import 'package:client/bloc/Details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => FieldBloc(),
        ),
        BlocProvider(
          create: (context) => VerficationBloc(),
        ),
        BlocProvider(create: (context) => DetailsBloc())
      ],
      child: const MaterialApp(
        home: OnboardingUi(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
