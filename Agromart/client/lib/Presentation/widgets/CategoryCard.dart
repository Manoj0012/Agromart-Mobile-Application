// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:flutter/material.dart';

class Categorycard extends StatelessWidget {
  final String label;
  final VoidCallback onpressed;
  const Categorycard({
    super.key,
    required this.label,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 50),
              backgroundColor: Color(utils.Primary_color),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Add radius here
              ),
            ),
            onPressed:onpressed,
            child:  Text(
             label,
              style: const TextStyle(color: Colors.white),
            )));
  }
}
