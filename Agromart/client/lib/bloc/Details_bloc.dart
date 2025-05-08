// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/bloc/Details.event.dart';
import 'package:client/bloc/Details_state.dart';
import 'package:client/models/DetailsModel.dart';
import 'package:client/Repo/UserRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<Details_OnsubmitEvent>((event, emit) async {
      final String firstname = event.firstname.trim();
      final String lastname = event.lastname.trim();
      String emailaddress = event.emailaddress.trim();
      final double? latitude = event.latitude;
      final double? longitude = event.longitude;
      final String phonenumber = event.phonenumber.trim();
      String location = "";
      await getValidate(firstname, lastname, emailaddress, phonenumber,
          longitude, latitude, emit);
      if (longitude == null && latitude == null) {
        return emit(DetailapageErrorState(error: "Set location"));
      }
      location = await getReadableAddress(latitude!, longitude!);
      final user = UserDetails(
          firstname: firstname,
          lastname: lastname,
          emailAddress: emailaddress,
          phonenumber: phonenumber,
          latitude: latitude,
          longitude: longitude,
          location: location);
      final res = await Userrepo.PostDetails(user);
      if (res != false) {
       return emit(DetailsSuccessState());
      }
       return  emit(DetailapageErrorState(error: "Use your Login email"));
    });
    //set location
    on<DetailsSetLocationEvent>(
      (event, emit) async {
        await getLocation(emit);
      },
    );
//navigate to home screen
    on<DetailsNavigateHomeEvent>(
      (event, emit) => emit(DetailsHomeNavigateState()),
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
  String placeAddress =
      await getReadableAddress(position.latitude, position.longitude);
  if (placeAddress.isEmpty) {
    return emit(DetailLocationError_State(errorMsg: "Unknown location error"));
  }
  return emit(DetailLocationSucess_State(
      geopostion: Geopostion(
          longitude: position.longitude,
          latitude: position.latitude,
          address: placeAddress)));
}

getReadableAddress(double latitude, double longitude) async {
  List<Placemark> placemark =
      await placemarkFromCoordinates(latitude, longitude);
  if (placemark.isNotEmpty) {
    final place = placemark.first;
    String readableAddress = '${place.locality},${place.administrativeArea}';
    return readableAddress;
  }
  return "";
}

getValidate(
    String firstname,
    String lastname,
    String emailaddress,
    String phonenumber,
    double? longitude,
    double? latitude,
    Emitter<DetailsState> emit) {
  final emailRegex = RegExp(r"^[\w\.\-+]+@[a-zA-Z0-9\-]+\.[a-zA-Z]{2,}$");
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
  return;
}
