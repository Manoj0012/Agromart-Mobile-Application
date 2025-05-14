import 'dart:io';

import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/Presentation/widgets/FieldButton.dart';
import 'package:client/Presentation/widgets/FieldTap.dart';
import 'package:flutter/material.dart';

class Addcroppage extends StatelessWidget {
  Addcroppage({super.key});
  final TextEditingController text = TextEditingController();
  final TextEditingController texter = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 140,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.file_upload_outlined),
                        iconSize: 50,
                        color: Color(utils.Primary_color),
                      ),
                      const Text("Upload Image")
                    ],
                  ),
                )
              ],
            ),
            Fieldtap(
                hint: "Crop Name", fieldname: "cropname", controller: text),
            Fieldtap(
                hint: "Crop Type", fieldname: "croptype", controller: text),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.44,
                    child: Fieldtap(
                        hint: "Enter Avaliable stock in Kg",
                        fieldname: "avaliabliy",
                        controller: text)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: Fieldtap(
                      hint: "Enter Price per Kg",
                      fieldname: "price",
                      controller: text),
                )
              ],
            ),
            Fieldtap(
                hint: "Description", fieldname: "details", controller: text),
            const SizedBox(
              height: 20,
            ),
            Fieldbutton(label: "Publish Crop", Onpressed: () {})
          ],
        ),
      ),
    );
  }
}
