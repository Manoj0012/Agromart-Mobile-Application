import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  static const storage = const FlutterSecureStorage();
  static const String tokenKey = "Token";
  static Future<String?> getToken() {
    return storage.read(key: tokenKey);
  }

  static Future<void> setToken(String token) async {
    await storage.write(key: tokenKey, value: token);
  }

  static Future<void> removeToken() async {
    await storage.delete(key: tokenKey);
  }
}