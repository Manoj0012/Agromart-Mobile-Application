import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String label;
  final String src;

  const HomeCard({super.key, required this.label, required this.src});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight = constraints.maxHeight * 0.5;
        double fontSize = constraints.maxHeight * 0.12;
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: imageHeight,
                child: Image.asset(src, fit: BoxFit.contain),
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
