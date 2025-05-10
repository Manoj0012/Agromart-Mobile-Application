import 'package:client/Presentation/widgets/HomeCategoriesCard.dart';
import 'package:client/Presentation/widgets/HomeFunctionButton.dart';
import 'package:client/Presentation/widgets/HomeHeader.dart';
import 'package:client/Presentation/widgets/Homeimage.dart';
import 'package:client/bloc/User_Bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Utiltis/Backgroundimage.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    String user = "Unkown";
    if (userState is UserAuthenticate) {
      user = userState.email;
    }
    // final Utils utils = Utils();
    final List<dynamic> labels = [
      {'label': 'Fruits', 'src': 'assets/fruit.png'},
      {'label': 'Vegetables', 'src': 'assets/veg.png'},
      {'label': 'Dairy', 'src': 'assets/dairy.png'},
      {'label': 'Rice', 'src': 'assets/rice.png'},
    ];
    return Scaffold(
      body: BackgroundImage(
          child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Homeheader(username: user),
            const HomeImageContainer(),
            Homefunctionbutton(onpressed: () {}),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: labels.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 5 / 4),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HomeCard(
                        label: labels[index]['label'],
                        src: labels[index]['src'],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
