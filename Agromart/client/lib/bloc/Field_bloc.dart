import 'package:flutter_bloc/flutter_bloc.dart';

class FieldBloc extends Bloc<FieldEvent, FieldState> {
  FieldBloc() : super(FieldInitial()) {
    on<FieldError_Event>((event, emit) {
      emit(FieldError_State(
          fieldname: event.fieldname, error_msg: event.error_msg));
    });
  }
}

class FieldState {}

class FieldInitial extends FieldState {}

class FieldError_State extends FieldState {
  final String fieldname;
  final String error_msg;
  FieldError_State({required this.fieldname, required this.error_msg});
}

class FieldEvent {}

class FieldError_Event extends FieldEvent {
  final String fieldname;
  final String error_msg;
  FieldError_Event({required this.fieldname, required this.error_msg});
}
