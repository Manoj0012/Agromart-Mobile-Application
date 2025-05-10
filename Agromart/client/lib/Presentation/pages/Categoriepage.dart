import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:client/Presentation/widgets/FieldButton.dart';
import 'package:flutter/material.dart';

class Categoriepage extends StatelessWidget {
  const Categoriepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Categories"),
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          ),
          body: Center(
            child: Text("hi"),
          )),
    );
  }
}
