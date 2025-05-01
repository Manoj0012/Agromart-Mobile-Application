import 'package:flutter/material.dart';

class Locationbutton extends StatelessWidget {
  final String label;
  final VoidCallback Onpressed;
  const Locationbutton(
      {super.key, required this.label, required this.Onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            const Color.fromARGB(255, 245, 243, 243), // or any background color
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // shadow color
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3), // shadow position
          ),
        ],
      ),
      child: TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Add radius here
            ),
          ),
          onPressed: Onpressed,
          child: Text(
            label,
            style: TextStyle(color: Colors.black, fontSize: 18),
          )),
    );
  }
}
