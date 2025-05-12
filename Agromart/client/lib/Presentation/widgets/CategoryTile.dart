import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:flutter/material.dart';

class Categorytile extends StatelessWidget {
  final String productname;
  final String productlocation;
  final String price;
  final String quantity;
  final bool available;
  final String src;

  const Categorytile(
      {super.key,
      required this.productname,
      required this.productlocation,
      required this.price,
      required this.quantity,
      required this.available,
      required this.src});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // mild shadow
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                src,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      productname,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      productlocation,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(utils.Secoundary_color)),
                    ),
                    Row(
                      children: [
                        Text(
                          "Rs $price ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(utils.Primary_color),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "per kg",
                          style:
                              TextStyle(color: Color(utils.Secoundary_color)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!available)
                      Text("Sold Out",
                          style: TextStyle(
                              color: Color(utils.error_color), fontSize: 20)),
                    if (available)
                      Text(
                        quantity,
                        style: const TextStyle(fontSize: 16),
                      ),
                    if (available)
                      Text(
                        "Avaliable",
                        style: TextStyle(color: Color(utils.Primary_color)),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
