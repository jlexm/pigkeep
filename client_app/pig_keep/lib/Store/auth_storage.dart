import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/* 
 Local storage for current user so that we can access this data even offline.
 Eg. user token for authentications
 */

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

  static Future<void> setUser(String serializedUser) async {
    await storage.write(key: 'curr_user', value: serializedUser);
  }

  static Future<String?> getUser() async {
    return await storage.read(key: 'curr_user');
  }

  static Future<String?> getUserFarms() async {
    return await storage.read(key: 'user_farms');
  }

  // serialized farms aka object that is converted to string by using jsonEncode from dart convert lib
  static Future<void> setUserFarms(String serializedFarms) async {
    await storage.write(key: 'user_farms', value: serializedFarms);
  }
}
