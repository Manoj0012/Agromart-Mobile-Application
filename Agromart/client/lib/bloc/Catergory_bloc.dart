import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatergoryBloc extends Bloc<CatergoryEvent, CatergoryState> {
  CatergoryBloc() : super(CatergorySucessState(data: [])) {
    on<CatergorySwitchEvent>((event, emit) async {
      final int indx = event.key;
      final postdata = [];
      emit(CatergoryLoadingState());
      switch (indx) {
        case 0:
          //filter All category data
          break;
        case 1:
          //filter rice
          break;
        case 2:
          //filter dairy
          break;
        case 3:
          //filter veg:
          break;
        case 4:
          //filter  fruits:
          break;
        default:
          return emit(CatergoryErrorState());
      }
      await Future.delayed(const Duration(seconds: 2));
      if (postdata.isEmpty) {
        return emit(CatergoryNoDataState());
      }
      return emit(CatergorySucessState(data: []));
    });
  }
}

class CatergoryState {}

class CatergoryLoadingState extends CatergoryState {}

class CatergorySucessState extends CatergoryState {
  final List<dynamic> data;
  CatergorySucessState({required this.data});
}

class CatergoryNoDataState extends CatergoryState {}

class CatergoryErrorState extends CatergoryState {}

class CatergoryEvent {}

class CatergorySwitchEvent extends CatergoryEvent {
  final int key;
  CatergorySwitchEvent({required this.key});
}
