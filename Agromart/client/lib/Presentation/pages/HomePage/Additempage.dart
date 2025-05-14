import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/pages/HomePage/AddCropPage.dart';
import 'package:client/Presentation/pages/HomePage/YourcropPage.dart';
import 'package:client/Presentation/pages/HomePage/Wigets/CategoryCard.dart';
import 'package:client/Presentation/pages/HomePage/Wigets/HomeAppbar.dart';
import 'package:client/bloc/CatergoryNav_bloc.dart';
import 'package:client/bloc/Dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Additempage extends StatefulWidget {
  const Additempage({super.key});

  @override
  State<Additempage> createState() => _AdditempageState();
}

class _AdditempageState extends State<Additempage> {
  @override
  void initState() {
    context.read<CatergorynavBloc>().add(CatergorynavEvent(key: 5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(context, "Add items"),
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Categorycard(
                      label: "Add item",
                      onpressed: () {
                        context
                            .read<CatergorynavBloc>()
                            .add(CatergorynavEvent(key: 5));
                        context
                            .read<DashboardBloc>()
                            .add(DashboardSwitchEvent(key: 5));
                      },
                      indexkey: 5),
                  Categorycard(
                      label: "Your Crop",
                      onpressed: () {
                        context
                            .read<CatergorynavBloc>()
                            .add(CatergorynavEvent(key: 6));
                        context
                            .read<DashboardBloc>()
                            .add(DashboardSwitchEvent(key: 6));
                      },
                      indexkey: 6)
                ],
              ),
              BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  if (state is DashboardAdditemState) {
                    return Addcroppage();
                  }
                  if (state is DashboardYourCropState) {
                    return const Expanded(child: Yourcroppage());
                  }
                  return const Text("404");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
