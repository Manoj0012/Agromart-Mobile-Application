// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/Presentation/Utiltis/utilis.dart';
import 'package:client/bloc/CatergoryNav_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categorycard extends StatelessWidget {
  final String label;
  final VoidCallback onpressed;
  final int indexkey;

  const Categorycard(
      {super.key,
      required this.label,
      required this.onpressed,
      required this.indexkey});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return BlocBuilder<CatergorynavBloc, CatergorynavState>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 50),
                  backgroundColor: state.key == indexkey
                      ? Colors.white
                      : Color(utils.Primary_color),
                  side: state.key == indexkey
                      ? BorderSide(
                          color: Color(utils.Primary_color), width: 1.0)
                      : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    // Add radius here
                  ),
                ),
                onPressed: onpressed,
                child: Text(
                  label,
                  style: TextStyle(
                      color:
                          state.key == indexkey ? Colors.black : Colors.white),
                )));
      },
    );
  }
}
