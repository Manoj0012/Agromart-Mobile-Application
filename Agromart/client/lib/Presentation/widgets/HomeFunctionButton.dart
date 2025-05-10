import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:flutter/material.dart';

class Homefunctionbutton extends StatelessWidget {
  final VoidCallback onpressed;

  const Homefunctionbutton({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Crop Categories",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          TextButton(
              onPressed: onpressed,
              child: Text(
                "View more",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(utils.Primary_color),
                    fontWeight: FontWeight.w700),
              )),
        ],
      ),
    );
  }
}
