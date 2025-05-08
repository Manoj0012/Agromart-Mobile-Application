import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/Utiltis/Logo.dart';
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/Presentation/Verficationpage_ui.dart';
import 'package:client/Presentation/widgets/FieldButton.dart';
import 'package:client/Presentation/widgets/FieldTap.dart';
import 'package:client/bloc/Field_Event.dart';
import 'package:client/bloc/Field_bloc.dart';
import 'package:client/bloc/Login_bloc.dart';
import 'package:client/bloc/Login_event.dart';
import 'package:client/bloc/Login_state.dart';
import 'package:client/bloc/User_Bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginpageUi extends StatefulWidget {
  const LoginpageUi({super.key});

  @override
  State<LoginpageUi> createState() => _LoginpageUiState();
}

class _LoginpageUiState extends State<LoginpageUi> {
  final TextEditingController email_controller = TextEditingController();
  final Utils utils = Utils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginError_State) {
            context.read<FieldBloc>().add(FieldError_Event(
                fieldname: state.fieldname, error_msg: state.error_msg));
          }
          if (state is LoginSucess_State) {
            context.read<UserBloc>().add(UserLoggedinEvent(email: state.email));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const VerficationpageUi(),
                ));
          }
        },
        builder: (context, state) {
          return BackgroundImage(
              child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Logo(),
                const SizedBox(
                  height: 50,
                ),
                Fieldtap(
                  label: "Login to Your Account",
                  hint: "Enter your gmail here",
                  fieldname: "email",
                  controller: email_controller,
                ),
                const SizedBox(
                  height: 20,
                ),
                Fieldbutton(
                  label: "Login",
                  Onpressed: () {
                    context.read<LoginBloc>().add(LoginSubmit_Event(
                          email: email_controller.text,
                        ));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginOnloadind_State) {
                      return Column(
                        children: [
                          CircularProgressIndicator(
                            color: Color(utils.Primary_color),
                          ),
                          const SizedBox(height:10,),
                           Text("Please wait",style: TextStyle(color:Color(utils.Secoundary_color),fontSize: 16,fontWeight:FontWeight.w300),)
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
