import 'package:client/bloc/Field_Event.dart';
import 'package:client/bloc/Field_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FieldBloc extends Bloc<FieldEvent, FieldState> {
  FieldBloc() : super(FieldInitial(fieldname:"")) {
    on<FieldError_Event>((event, emit) async {
      emit(FieldError_State(
          fieldname: event.fieldname, error_msg: event.error_msg));
      await Future.delayed(const Duration(seconds: 2));
      emit(FieldInitial(fieldname:event.fieldname));
    });
  }
}
