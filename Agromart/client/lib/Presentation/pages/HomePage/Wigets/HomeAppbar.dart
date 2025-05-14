import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/bloc/BottomNav_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar HomeAppbar(BuildContext context,String label) {
  Utils utils = Utils();
  return AppBar(
    backgroundColor: Colors.transparent,
    title:  Text(
     label,
      style: const TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
    ),
    leading: Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Center(
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(utils.Primary_color), // border color
              width: 2.0, // border width
            ),
            borderRadius:
                BorderRadius.circular(12), // optional: rounded corners
          ),
          child: IconButton(
              onPressed: () {
                context
                    .read<BottomnavBloc>()
                    .add(BottomnavbuttonClickedEvent(index: 0));
              },
              icon: const Icon(Icons.arrow_back)),
        ),
      ),
    ),
  );
}
