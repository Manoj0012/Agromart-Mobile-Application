import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/Presentation/widgets/CategoryCard.dart';
import 'package:client/Presentation/widgets/CategoryTile.dart';
import 'package:flutter/material.dart';

class Categoriepage extends StatelessWidget {
  const Categoriepage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final List<dynamic> Topbar = [
      {'label': "All", 'onpressed': () {}},
      {'label': "Rice", 'onpressed': () {}},
      {'label': "Vegetables", 'onpressed': () {}},
      {'label': "Dairy", 'onpressed': () {}},
      {'label': "Fruits", 'onpressed': () {}},
    ];
    Utils utils = Utils();
    return BackgroundImage(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Categories"),
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          ),
          body: Padding(
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
                          label: Topbar[index]['label'],
                          onpressed: Topbar[index]['onpressed']);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Categorytile(
                        productname: 'Rice',
                        productlocation: "nagercoil,Tamil Nadu",
                        price: "40",
                        quantity: "100",
                        available: true,
                        src: 'assets/veg.png',
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          )),
    );
  }
}
