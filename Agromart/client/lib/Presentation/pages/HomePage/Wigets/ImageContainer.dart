import 'package:client/bloc/Field_bloc.dart';
import 'package:client/bloc/Field_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Imagecontainer extends StatelessWidget {
  final String fieldname;
  const Imagecontainer({super.key, required this.fieldname});
  @override
  Widget build(BuildContext context) {
    Border isborder = Border.all(color: Colors.grey.shade400, width: 2);
    return BlocBuilder<FieldBloc, FieldState>(
      builder: (context, state) {
        if (state is FieldError_State && state.fieldname == fieldname) {
          isborder = Border.all(color: Colors.red.shade400, width: 2);
        }
        return Container(
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            border: isborder,
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
          ),
          width: MediaQuery.of(context).size.width * 0.4,
          height: 140,
          child: (state is FieldError_State && state.fieldname == fieldname)
              ? Text(
                  state.error_msg,
                  style: TextStyle(color: Colors.red.shade400, fontSize: 18),
                )
              : Text(
                  "Crop Image",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600),
                ),
        );
      },
    );
  }
}
