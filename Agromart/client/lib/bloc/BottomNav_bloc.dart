// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomnavBloc extends Bloc<BottomnavEvent, BottomnavState> {
  BottomnavBloc() : super(BottomnavHome(index: 0)) {
    on<BottomnavbuttonClickedEvent>((event, emit) {
      int index = event.index;
      if (index == 0) {
        return emit(BottomnavHome(index: 0));
      } else if (index == 1) {
        return emit(BottomnavCategory(index: 1));
      } else if (index == 2) {
        return emit(BottomnavAdd(index: 2));
      } else if (index == 3) {
        return emit(BottomnavProfile(index: 3));
      }
      return emit(BottomnavErrorState(index: 0));
    });
  }
}

class BottomnavState {
   final int index;
  BottomnavState({
    required this.index,
  });
}

class BottomnavHome extends BottomnavState {
  BottomnavHome({required super.index});
    
}

class BottomnavCategory extends BottomnavState {
  BottomnavCategory({required super.index});
 
}

class BottomnavAdd extends BottomnavState {
  BottomnavAdd({required super.index});
 
}

class BottomnavProfile extends BottomnavState {
  BottomnavProfile({required super.index});
  
}

class BottomnavErrorState extends BottomnavState {
  BottomnavErrorState({required super.index});
 
}

class BottomnavEvent {}

class BottomnavbuttonClickedEvent extends BottomnavEvent {
  final int index;
  BottomnavbuttonClickedEvent({required this.index});
}
