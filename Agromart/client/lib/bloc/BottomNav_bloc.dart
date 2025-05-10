import 'package:flutter_bloc/flutter_bloc.dart';

class BottomnavBloc extends Bloc<BottomnavEvent, BottomnavState> {
  BottomnavBloc() : super(BottomnavHome()) {
    on<BottomnavbuttonClickedEvent>((event, emit) {
      int index = event.index;
      if (index == 0) {
        return emit(BottomnavHome());
      } else if (index == 1) {
        return emit(BottomnavCategory());
      } else if (index == 2) {
        return emit(BottomnavAdd());
      } else if (index == 3) {
        return emit(BottomnavProfile());
      }
      return  emit(BottomnavErrorState());
    });
  }
}

class BottomnavState {}

class BottomnavHome extends BottomnavState {}

class BottomnavCategory extends BottomnavState {}

class BottomnavAdd extends BottomnavState {}

class BottomnavProfile extends BottomnavState {}

class BottomnavErrorState extends BottomnavState {}

class BottomnavEvent {}

class BottomnavbuttonClickedEvent extends BottomnavEvent {
  final int index;
  BottomnavbuttonClickedEvent({required this.index});
}
