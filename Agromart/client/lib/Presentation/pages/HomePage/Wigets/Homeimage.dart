import 'package:flutter/material.dart';

class HomeImageContainer extends StatelessWidget {
  const HomeImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage("assets/Homeassets1.png"), // change to your image
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
