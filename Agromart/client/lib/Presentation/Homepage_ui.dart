// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'Utiltis/Backgroundimage.dart';

class HomepageUi extends StatelessWidget {
  final dynamic userdata;
  const HomepageUi({
    super.key,
    required this.userdata,
  });

  @override
  Widget build(BuildContext context) {
    print(userdata);
    return const Scaffold(
      body: BackgroundImage(child: Center(child: Text("hi"))),
    );
  }
}
