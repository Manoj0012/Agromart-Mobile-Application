import 'package:client/Service/Apihelper.dart';
import 'package:client/Service/TokenService.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static final Api = Apihelper.getApiIntance();
  static Future<dynamic> AuthOnboarding() async {
    try {
      var res = await Api.get('/api');
      if (res.statusCode == 200) {
        return res.data;
      }
      return false;
    } catch (error) {
      if (error is DioException && error.response?.statusCode == 401) {
        return false;
      }
      return throw error;
    }
  }

  static Future<dynamic> AuthLogin(String email) async {
    try {
      var res = await Api.post('/api/user/login', data: {"email": email});
      if (res.statusCode == 200) {
        return res.data;
      }
    } catch (error) {
      if (error is DioException) {
        return false;
      }
      return throw error;
    }
  }

  static Future<dynamic> AuthVerfication(String email, String OTP) async {
    try {
      var res = await Api.post('/api/user/verifyotp',
          data: {"email": email, "user_OTP": OTP});
      if (res.statusCode == 200) {
        String token = res.data['token'];
        await TokenService.setToken(token);
        return res.data;
      }
    } catch (error) {
      if (error is DioException) {
        print(error);
        return false;
      }
      print(error);
      return throw error;
    }
  }
}
