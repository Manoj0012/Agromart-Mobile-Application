import 'package:flutter/material.dart';

class Verficationtitle extends StatelessWidget {
  final String gmail;
  const Verficationtitle({super.key, required this.gmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text(
            "Verfication Code",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            "please Enter the Verification code Send to $gmail",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
