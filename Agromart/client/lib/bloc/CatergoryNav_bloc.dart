import 'package:flutter_bloc/flutter_bloc.dart';

class CatergorynavBloc extends Bloc<CatergorynavEvent, CatergorynavState> {
  CatergorynavBloc() : super(CatergorynavState(key:0)) {
    on<CatergorynavEvent>((event, emit) {
      emit(CatergorynavState(key:event.key));
    });
  }
}

class CatergorynavState {
  final int key;
  CatergorynavState({required this.key});
}

class CatergorynavEvent {
  final int key;
  CatergorynavEvent({required this.key});
}
