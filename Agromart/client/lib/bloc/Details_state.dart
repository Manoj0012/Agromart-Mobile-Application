// ignore_for_file: public_member_api_docs, sort_constructors_first

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
  final geopostion;
  DetailLocationSucess_State({required this.geopostion});
}

class DetailsSuccessState extends DetailsState {}

class DetailsHomeNavigateState extends DetailsState {}

class DetailapageErrorState extends DetailsState {
  final String error;

  DetailapageErrorState({required this.error});
}

class Geopostion {
  double longitude;
  double latitude;
  String address;
  Geopostion({
    required this.longitude,
    required this.latitude,
    required this.address,
  });
}
