import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardAdditemState()) {
    on<DashboardSwitchEvent>((event, emit) {
      int index = event.key;
      if (index == 5) {
        return emit(DashboardAdditemState());
      }
      if (index == 6) {
        return emit(DashboardYourCropState());
      }
      emit(DashboardErrorState());
    });
  }
}

class DashboardState {}

class DashboardYourCropState extends DashboardState {}

class DashboardAdditemState extends DashboardState {}

class DashboardErrorState extends DashboardState {}

class DashboardEvent {}

class DashboardSwitchEvent extends DashboardEvent {
  final int key;
  DashboardSwitchEvent({required this.key});
}
