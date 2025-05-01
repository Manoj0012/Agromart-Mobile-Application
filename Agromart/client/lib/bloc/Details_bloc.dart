// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/bloc/Details.event.dart';
import 'package:client/bloc/Details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<Details_OnsubmitEvent>((event, emit) {
      final emailRegex = RegExp(r"^[\w\.\-+]+@[a-zA-Z0-9\-]+\.[a-zA-Z]{2,}$");
      final String firstname = event.firstname.trim();
      final String lastname = event.lastname.trim();
      String emailaddress = event.emailaddress.trim();
      final latitude = event.latitude;
      final longitude = event.longitude;
      final String phonenumber = event.phonenumber.trim();
      if (firstname.isEmpty) {
        return emit(DetailsErrorState(
            fieldname: "firstname", errorMsg: "Firstname must be filled"));
      } else if (lastname.isEmpty) {
        return emit(DetailsErrorState(
            fieldname: "lastname", errorMsg: "Lastname must be filled"));
      } else if (!emailRegex.hasMatch(emailaddress)) {
        return emit(DetailsErrorState(
            fieldname: "emailaddress", errorMsg: "email is not valid"));
      } else if (!RegExp(r"^\d{10}$").hasMatch(phonenumber)) {
        return emit(DetailsErrorState(
            fieldname: "phonenumber", errorMsg: "Not valid phonenumber"));
      } else if (longitude == null || latitude == null) {
        return emit(DetailLocationError_State(errorMsg: "Set location "));
      }
      emit(DetailsSuccessState());
    });
    on<DetailsSetLocationEvent>(
      (event, emit) async {
        await getLocation(emit);
      },
    );
  }
}

Future<void> getLocation(Emitter<DetailsState> emit) async {
  bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!isServiceEnabled) {
    return emit(
        DetailLocationError_State(errorMsg: "Enable Location to Continue"));
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return emit(DetailLocationError_State(
          errorMsg: "Allow Location Service to Continue"));
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return emit(
        DetailLocationError_State(errorMsg: "Location Service Turned off"));
  }
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return emit(DetailLocationSucess_State(position: position));
}
