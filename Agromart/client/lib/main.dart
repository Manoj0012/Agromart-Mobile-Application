import 'package:client/Presentation/Loginpage_ui.dart';
import 'package:client/Presentation/Onboarding_ui.dart';
import 'package:client/bloc/BottomNav_bloc.dart';
import 'package:client/bloc/Field_bloc.dart';
import 'package:client/bloc/Login_bloc.dart';
import 'package:client/bloc/Onboarding_bloc.dart';
import 'package:client/bloc/User_Bloc.dart';
import 'package:client/bloc/Verfication_bloc.dart';
import 'package:client/bloc/Details_bloc.dart';
import 'package:client/Service/Apihelper.dart';
import 'package:client/Service/NavigatorService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Apihelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
        BlocProvider(create: (context) => DetailsBloc()),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => BottomnavBloc())
      ],
      child: MaterialApp(
        home: const OnboardingUi(),
        navigatorKey: NavigatorService.navigatorKey,
        routes: {'/login': (context) => const LoginpageUi()},
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
