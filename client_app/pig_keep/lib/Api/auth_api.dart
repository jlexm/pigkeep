import 'package:pig_keep/Api/api.dart';

class AuthApi {
  static login(String username, String password) {
    return API
        .post('/auth/login', {"username": username, "password": password});
  }
}
