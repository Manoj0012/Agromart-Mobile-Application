import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:flutter/material.dart';

class Fieldbutton extends StatelessWidget {
  final String label;
  final VoidCallback Onpressed;
  const Fieldbutton({super.key, required this.label, required this.Onpressed});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width, 50),
          backgroundColor: Color(utils.Primary_color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Add radius here
          ),
        ),
        onPressed: Onpressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ));
  }
}
