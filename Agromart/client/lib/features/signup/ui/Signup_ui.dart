import 'package:client/features/Login/ui/Login_page.dart';
import 'package:client/features/signup/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    signupbloc.add(SignupIntialEvent());
    super.initState();
  }

  final SignupBloc signupbloc = SignupBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
      bloc: signupbloc,
      listenWhen: (previous, current) => current is SignupActionState,
      buildWhen: (previous, current) => current is! SignupActionState,
      listener: (context, state) {
        if (state is LoginSwitchstate) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case SignupSwitchstate:
            return Scaffold(
              body: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Onboarding.png"),
                      fit: BoxFit.cover),
                ),
                child: SingleChildScrollView(
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
                                  image:
                                      AssetImage('assets/images/farmbuy.png')),
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
                                "Create Your Account",
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
                                        hintText: "Enter Your Email",
                                        border: OutlineInputBorder(),
                                        suffixIcon: Icon(Icons.email)),
                                  )),
                              SizedBox(height: 20),
                              Container(
                                  height: 50,
                                  width: 300,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Enter Your Password",
                                        border: OutlineInputBorder(),
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.visibility),
                                        )),
                                  )),
                              SizedBox(height: 20),
                              Container(
                                  height: 50,
                                  width: 300,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Confirm Your Password",
                                        border: OutlineInputBorder(),
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.visibility),
                                        )),
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
                                    "SignUp",
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
                                    signupbloc.add(LoginNavigateEvent());
                                  },
                                  child: Text(
                                    "Already Have a Account?",
                                    style: TextStyle(fontSize: 16),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
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
