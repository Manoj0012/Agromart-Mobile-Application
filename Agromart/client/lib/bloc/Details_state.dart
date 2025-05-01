import 'package:geolocator/geolocator.dart';

class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsErrorState extends DetailsState {
  final String errorMsg;
  final String fieldname;
  DetailsErrorState({
    required this.errorMsg,
    required this.fieldname,
  });
}

class DetailLocationError_State extends DetailsState {
  final String errorMsg;
  DetailLocationError_State({required this.errorMsg});
}
class DetailLocationSucess_State extends DetailsState {
  final Position position;
  DetailLocationSucess_State({required this.position});
}
class DetailsSuccessState extends DetailsState {}

