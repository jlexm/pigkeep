import 'package:pig_keep/Api/api.dart';

class UserApi {
  static register(String email, String firstName , String lastName, String username, String? phoneNumber,
      String password, String confirmPassword) {
    return API.post('/users/sign-up', {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "username": username,
      "phone_number": phoneNumber,
      "password": password,
      "confirm_password": confirmPassword
    });
  }

  static getUser(String username) {
    return API.get('/users/$username');
  }
}
