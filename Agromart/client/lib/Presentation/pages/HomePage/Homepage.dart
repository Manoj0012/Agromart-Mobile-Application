import 'package:client/Presentation/pages/HomePage/Categoriepage.dart';
import 'package:client/Presentation/pages/HomePage/Wigets/HomeCategoriesCard.dart';
import 'package:client/Presentation/pages/HomePage/Wigets/HomeFunctionButton.dart';
import 'package:client/Presentation/pages/HomePage/Wigets/HomeHeader.dart';
import 'package:client/Presentation/pages/HomePage/Wigets/Homeimage.dart';
import 'package:client/bloc/CatergoryNav_bloc.dart';
import 'package:client/bloc/Catergory_bloc.dart';
import 'package:client/bloc/User_Bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Utiltis/Backgroundimage.dart';

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
      {
        'label': 'Fruits',
        'src': 'assets/fruit.png',
        'onpressed': () {
          context.read<CatergoryBloc>().add(CatergorySwitchEvent(key: 4));
          context.read<CatergorynavBloc>().add(CatergorynavEvent(key: 4));
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Categoriepage(),
              ));
        }
      },
      {
        'label': 'Vegetables',
        'src': 'assets/veg.png',
        'onpressed': () {
          context.read<CatergoryBloc>().add(CatergorySwitchEvent(key: 2));
          context.read<CatergorynavBloc>().add(CatergorynavEvent(key: 2));
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Categoriepage(),
              ));
        }
      },
      {
        'label': 'Dairy',
        'src': 'assets/dairy.png',
        'onpressed': () {
          context.read<CatergoryBloc>().add(CatergorySwitchEvent(key: 3));
          context.read<CatergorynavBloc>().add(CatergorynavEvent(key: 3));
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Categoriepage(),
              ));
        }
      },
      {
        'label': 'Grains',
        'src': 'assets/rice.png',
        'onpressed': () {
          context.read<CatergoryBloc>().add(CatergorySwitchEvent(key: 1));
          context.read<CatergorynavBloc>().add(CatergorynavEvent(key: 1));
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Categoriepage(),
              ));
        }
      },
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
                          onpressed: labels[index]['onpressed']),
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
