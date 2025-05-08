import 'package:client/models/DetailsModel.dart';
import 'package:client/Service/Apihelper.dart';

class Userrepo {
  static final Api = Apihelper.getApiIntance();

  static PostDetails(UserDetails userdetails) async {
    try {
      final data = {
        "firstname": userdetails.firstname,
        "lastname": userdetails.lastname,
        "emailAddress": userdetails.emailAddress,
        "phonenumber": userdetails.phonenumber,
        "latitude": userdetails.latitude,
        "longitude": userdetails.longitude,
        "location": userdetails.location,
      };
      var res = await Api.post("/api/user/userprofile", data: data);
      if (res != null && res.statusCode==200) {
        return true;
      }
      return false;
    } catch (error) {
            return false;
    }
  }
}
