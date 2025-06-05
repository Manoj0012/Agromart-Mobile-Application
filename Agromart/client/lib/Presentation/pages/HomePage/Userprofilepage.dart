import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/pages/HomePage/Wigets/HomeAppbar.dart';
import 'package:client/Presentation/widgets/FieldButton.dart';
import 'package:client/Service/TokenService.dart';
import 'package:client/bloc/User_Bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserprofilePage extends StatelessWidget {
  const UserprofilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userdata = context.watch<UserBloc>().state;
    if (userdata is UserAuthenticate) {
      print(userdata);
    }
    return Scaffold(
      appBar: HomeAppbar(context, "Profile", () {}),
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Fieldbutton(
                label: "Logout",
                Onpressed: () async {
                  await TokenService.removeToken();
                }),
          ),
        ),
      ),
    );
  }
}
