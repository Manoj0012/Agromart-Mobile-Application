import 'package:client/features/Login/bloc/login_bloc.dart';
import 'package:client/features/home/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginbloc.add(LoginIntialEvent());
  }

  final LoginBloc loginbloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginbloc,
      listenWhen:(previous, current) => current is LoginActionstate,
      buildWhen: (previous, current) => current is! LoginActionstate,
      listener: (context, state) {
        if(state is SignupSwitchstate){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homepage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoginInitialState:
            return Scaffold(
              body: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Onboarding.png"),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
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
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xffff09051c)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              "Login With Your account",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: 50,
                                width: 300,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                )),
                            SizedBox(height: 20),
                            Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Or"),
                            TextButton(
                                onPressed: () {
                                  loginbloc.add(SignupNavigateEvent());
                                },
                                child: Text(
                                  "Create New Account",
                                  style: TextStyle(fontSize: 16),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
