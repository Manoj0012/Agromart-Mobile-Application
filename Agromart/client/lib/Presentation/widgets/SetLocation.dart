// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/Presentation/widgets/LocationButton.dart';
import 'package:flutter/material.dart';

class Setlocation extends StatelessWidget {
  final VoidCallback onPressed;
  const Setlocation({
    super.key,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    Utils utils=Utils();
    return               Container(
                height: MediaQuery.of(context).size.height * 0.10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on_rounded,
                              size: 30, color: Color(utils.location_color)),
                          const Text(
                            "Your Location",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ]),
                    Locationbutton(label: "Set Location", Onpressed:onPressed)
                  ],
                ),
              );
  }
}
