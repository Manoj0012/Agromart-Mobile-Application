import 'package:client/Models/CropModels.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewitemBloc extends Bloc<ViewitemEvent, ViewitemState> {
  ViewitemBloc() : super(ViewitemLodingState()) {
    on<ViewNavigateEvent>((event, emit) {
      emit(ViewitemsSucessState(data: event.data));
    });
  }
}

class ViewitemLodingState extends ViewitemState {}

class ViewitemState {}

class ViewitemsSucessState extends ViewitemState {
  final CropProduct data;
  ViewitemsSucessState({required this.data});
}

class ViewitemEvent {}

class ViewNavigateEvent extends ViewitemEvent {
  final CropProduct data;
  ViewNavigateEvent({required this.data});
}
