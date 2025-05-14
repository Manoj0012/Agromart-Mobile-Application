import 'package:client/Presentation/pages/HomePage/Wigets/CategoryTile.dart';
import 'package:flutter/widgets.dart';

class Yourcroppage extends StatelessWidget {
  const Yourcroppage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Categorytile(
              productname: "sample",
              productlocation: "dcsvdv",
              price: "dv",
              quantity: "10",
              available: true,
              src: "assets/rice.png");
        });
  }
}
