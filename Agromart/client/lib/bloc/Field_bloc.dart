import 'package:client/bloc/Field_Event.dart';
import 'package:client/bloc/Fiels_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FieldBloc extends Bloc<FieldEvent, FieldState> {
  FieldBloc() : super(FieldInitial()) {
    on<FieldError_Event>((event, emit) {
      emit(FieldError_State(
          fieldname: event.fieldname, error_msg: event.error_msg));
    });
  }
}




