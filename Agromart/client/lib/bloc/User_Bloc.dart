import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserUnAuthenticate()) {
    on<UserLoggedinEvent>((event, emit) {
      emit(UserAuthenticate(email: event.email));
    });
  }
}

class UserState {}

class UserAuthenticate extends UserState {
  final String email;
  UserAuthenticate({required this.email});
}

class UserUnAuthenticate extends UserState {}

class UserEvent {}

class UserLoggedinEvent extends UserEvent {
  final String email;
  UserLoggedinEvent({required this.email});
}

class UserLoggedoutEvent extends UserEvent {}
