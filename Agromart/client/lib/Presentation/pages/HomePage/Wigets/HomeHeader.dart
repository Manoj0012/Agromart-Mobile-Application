import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:flutter/material.dart';

class Homeheader extends StatelessWidget {
  final String username;
  const Homeheader({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Welcome, ",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            username,
            style: TextStyle(
                fontSize: 24,
                color: Color(utils.Primary_color),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
