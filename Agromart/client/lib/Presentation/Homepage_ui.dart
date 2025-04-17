import 'package:client/Presentation/Utiltis/Backgroundimage.dart';
import 'package:flutter/material.dart';

class HomepageUi extends StatelessWidget {
  const HomepageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BackgroundImage(child: Center(child: Text("Home page"))),
    );
  }
}
