
class UserDetails {
  final String firstname;
  final String lastname;
  final String emailAddress;
  final String phonenumber;
  final double? latitude;
  final double? longitude;
  final String location;
  UserDetails(
      {required this.firstname,
      required this.lastname,
      required this.emailAddress,
      required this.phonenumber,
      required this.latitude,
      required this.longitude,
      required this.location});
}
