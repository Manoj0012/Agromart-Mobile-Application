import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:flutter/material.dart';

class Viewfield extends StatelessWidget {
  final String? labels;
  final String value;

  const Viewfield({super.key, this.labels, required this.value});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        labels != null
            ? Text(
                labels!,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              )
            : Text(""),
        labels != null
            ? const SizedBox(
                width: 10,
              )
            : const SizedBox(),
        Text(
          value,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(utils.Primary_color)),
        )
      ],
    );
  }
}
