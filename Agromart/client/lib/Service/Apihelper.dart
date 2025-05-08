// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/Service/NavigatorService.dart';
import 'package:client/Service/TokenService.dart';
import 'package:dio/dio.dart';

class Apihelper {
  static late final dio;
  static void init() {
    dio = Dio(BaseOptions(baseUrl: "http://localhost:8080", headers: {
      'Content-Type': 'application/json',
    }));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await TokenService.getToken();
        options.headers['Authorization'] = 'Bearer ${token}';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          await TokenService.removeToken();
          await Future.delayed(const Duration(seconds: 2));
          NavigatorService.loginRedirect();
          return handler.reject(error);
        }
        return handler.next(error);
      },
    ));
  }

  static getApiIntance() {
    return dio;
  }
}
