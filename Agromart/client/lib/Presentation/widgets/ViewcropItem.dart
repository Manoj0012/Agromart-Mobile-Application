import 'package:client/Models/CropModels.dart';
import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/Presentation/pages/HomePage/Categoriepage.dart';
import 'package:client/Presentation/pages/HomePage/Wigets/HomeAppbar.dart';
import 'package:client/Presentation/pages/HomePage/Wigets/ImageContainer.dart';
import 'package:client/Presentation/widgets/SkeletonTile.dart';
import 'package:client/Presentation/widgets/ViewField.dart';
import 'package:client/bloc/User_Bloc.dart';
import 'package:client/bloc/Viewitem_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Viewcropitem extends StatelessWidget {
  const Viewcropitem({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    final UserState = context.watch<UserBloc>().state;
    var user;
    return BlocConsumer<ViewitemBloc, ViewitemState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (UserState is UserAuthenticate) {
        
        }
        if (state is ViewitemLodingState) {
          return const Skeletontile();
        }
        if (state is ViewitemsSucessState) {
          CropProduct data = state.data;
          return Scaffold(
            appBar: HomeAppbar(context, data.cropName, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Categoriepage(),
                  ));
            }),
            body: BackgroundImage(
                child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Imagecontainer(fieldname: "imagecon"),
                      SizedBox(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Viewfield(labels: "Name: ", value: data.cropName),
                            Viewfield(labels: "Type: ", value: data.cropType),
                            Viewfield(
                                labels: "avaliblity: ",
                                value: data.availability),
                            Viewfield(value: data.location),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Description:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      data.description,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(utils.Primary_color)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "Seller Details",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            )),
          );
        }
        return const Text("Internal Error");
      },
    );
  }
}
