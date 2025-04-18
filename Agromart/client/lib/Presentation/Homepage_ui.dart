
import 'package:flutter/material.dart';

import 'Utiltis/Backgroundimage.dart';

class HomepageUi extends StatelessWidget {
  const HomepageUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const BackgroundImage(child: Center(child: Text("Home page"))),
    );
  }
}
