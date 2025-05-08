class DetailsEvent {}

// ignore: camel_case_types
class Details_OnsubmitEvent extends DetailsEvent {
  final String firstname;
  final String lastname;
  final String emailaddress;
  final String phonenumber;
  final double? latitude;
  final double? longitude;

  Details_OnsubmitEvent(
      {required this.firstname,
      required this.lastname,
      required this.emailaddress,
      required this.phonenumber,
      required this.latitude,
      required this.longitude});
}

class DetailsSetLocationEvent extends DetailsEvent {
  
}

class DetailsNavigateHomeEvent extends DetailsEvent {
  
}
