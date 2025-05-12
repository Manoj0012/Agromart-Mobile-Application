// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/Presentation/pages/Additempage.dart';
import 'package:client/Presentation/pages/Categoriepage.dart';
import 'package:client/Presentation/pages/Homepage.dart';
import 'package:client/Presentation/pages/Userprofilepage.dart';
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/bloc/BottomNav_bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomepageUi extends StatelessWidget {
  const HomepageUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();

    return Scaffold(
        body: BlocConsumer<BottomnavBloc, BottomnavState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is BottomnavHome) {
              return Homepage();
            }
            if (state is BottomnavCategory) {
              return const Categoriepage();
            }
            if (state is BottomnavAdd) {
              return const Additempage();
            }
            if (state is BottomnavProfile) {
              return const UserprofilePage();
            }
            return const CircularProgressIndicator();
          },
        ),
        bottomNavigationBar: CurvedNavigationBar(
            onTap: (index) {
              context
                  .read<BottomnavBloc>()
                  .add(BottomnavbuttonClickedEvent(index: index));
            },
            backgroundColor: Colors.transparent,
            color: Color(utils.Primary_color),
            buttonBackgroundColor: Colors.green,
            items: const <Widget>[
              Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.category_outlined,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.add_box_rounded,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
            ]));
  }
}
