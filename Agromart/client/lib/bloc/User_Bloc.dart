import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserUnAuthenticate()) {
    on<UserLoggedinEvent>((event, emit) {
      emit(UserLogginState(email: event.email));
    });
    on<UserAuthenticatedEvent>((event, emit) {
      final dynamic data = event.userdata;
      emit(UserAuthenticate(userdata: data));
    });
  }
}

class UserState {}

class UserAuthenticate extends UserState {
  final dynamic userdata;
  UserAuthenticate({required this.userdata});
}

class UserUnAuthenticate extends UserState {}

class UserLogginState extends UserState {
  final String email;
  UserLogginState({required this.email});
}

class UserAuthenticatedEvent extends UserEvent {
  final dynamic userdata;
  UserAuthenticatedEvent({required this.userdata});
}

class UserEvent {}

class UserLoggedinEvent extends UserEvent {
  final String email;
  UserLoggedinEvent({required this.email});
}

class UserLoggedoutEvent extends UserEvent {}
