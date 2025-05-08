// ignore: file_names
import "package:client/bloc/Field_bloc.dart";
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/Field_state.dart';
import '../Utiltis/utilis.dart';

class Fieldtap extends StatelessWidget {
  final String? label;
  final String hint;
  final String fieldname;
  final TextEditingController controller;
  const Fieldtap({
    super.key,
    this.label,
    required this.hint,
    required this.fieldname,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();
    String? errorText;

    return BlocConsumer<FieldBloc, FieldState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FieldError_State && state.fieldname == fieldname) {
          errorText = state.error_msg;
        }
        if (state is FieldInitial && state.fieldname == fieldname) {
          errorText = null;
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            label != null
                ? Text(
                    label!,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(utils.TextBold_color),
                        fontWeight: FontWeight.bold),
                  )
                : const SizedBox.shrink(),
            label != null
                ? const SizedBox(height: 20)
                : const SizedBox(height: 20),
            TextField(
                controller: controller,
                decoration: InputDecoration(
                  errorText: errorText,
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Color(utils.error_color),
                        width: 2), // on focus
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Color(utils.error_color),
                        width: 2), // on focus
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(utils.Primary_color),
                        width: 2), // on focus
                  ),
                  hintText: hint,
                  hintStyle: TextStyle(
                      color: Color(utils.Secoundary_color),
                      fontWeight: FontWeight.w300),
                )),
          ],
        );
      },
    );
  }
}
