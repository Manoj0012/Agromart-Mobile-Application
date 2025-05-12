import 'package:client/Models/CropModels.dart';
import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/Presentation/widgets/CategoryCard.dart';
import 'package:client/Presentation/widgets/CategoryTile.dart';
import 'package:client/Presentation/widgets/SkeletonTile.dart';
import 'package:client/bloc/CatergoryNav_bloc.dart';
import 'package:client/bloc/Catergory_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categoriepage extends StatefulWidget {
  const Categoriepage({super.key});
  @override
  State<Categoriepage> createState() => _CategoriepageState();
}

class _CategoriepageState extends State<Categoriepage> {
  @override
  void initState() {
    super.initState();
    context.read<CatergoryBloc>().add(CatergorySwitchEvent(key: 0));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final List<dynamic> Topbar = [
      {'label': "All"},
      {'label': "Grains"},
      {'label': "Vegetables"},
      {'label': "Dairy"},
      {'label': "Fruits"},
    ];
    Utils utils = Utils();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Categories",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Center(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(utils.Primary_color), // border color
                    width: 2.0, // border width
                  ),
                  borderRadius:
                      BorderRadius.circular(12), // optional: rounded corners
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
            ),
          ),
        ),
        body: BackgroundImage(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Categorycard(
                          indexkey: index,
                          label: Topbar[index]['label'],
                          onpressed: () {
                            context
                                .read<CatergoryBloc>()
                                .add(CatergorySwitchEvent(key: index));
                            context
                                .read<CatergorynavBloc>()
                                .add(CatergorynavEvent(key: index));
                          });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: BlocBuilder<CatergoryBloc, CatergoryState>(
                    builder: (context, state) {
                      if (state is CatergoryLoadingState) {
                        return ListView.builder(
                          itemBuilder: (context, index) => const Skeletontile(),
                        );
                      }
                      if (state is CatergorySucessState) {
                        List<CropProduct> data = state.data;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Categorytile(
                              productname: data[index].cropName,
                              productlocation: data[index].location,
                              price: data[index].pricePerKG,
                              quantity: data[index].cropColor,
                              available: true,
                              src: 'assets/veg.png',
                            );
                          },
                        );
                      }
                      if (state is CatergoryNoDataState) {
                        return const Center(
                          child: Text(
                            "No Data Found!",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        );
                      }
                      return const Text("");
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ));
  }
}
