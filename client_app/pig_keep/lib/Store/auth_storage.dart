import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  static const storage = FlutterSecureStorage();

  static Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  static Future<void> updateToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<void> clearToken() async {
    await storage.delete(key: 'token');
  }
}
