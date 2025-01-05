import 'package:pig_keep/Api/api.dart';

class UserApi {
  static register(
      String email,
      String firstName,
      String lastName,
      String username,
      String? phoneNumber,
      String password,
      String confirmPassword) {
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

  static getMyDetails() {
    return API.get('/users/my-details');
  }

  static updateMyDetails(Map<String, dynamic> body) {
    return API.post('/users/my-details', body);
  }

  static updatePassword(String oldPassword, String password) {
    return API.post('/users/my-password',
        {'old_password': oldPassword, 'password': password});
  }

  static addCaretaker(String username, String phoneNumber, String firstName,
      String lastName, String password) {
    return API.post('/users/manage/caretaker', {
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'password': password
    });
  }

  static getCaretakers() {
    return API.get('/users/manage/caretaker');
  }

  static updateCaretaker(String username, String phoneNumber, String firstName,
      String lastName, String password) {
    return API.patch('/users/manage/caretaker', {
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'password': password
    });
  }

  static getUserAgeCategorySettings() {
    return API.get('/users/category/settings');
  }

  static updateUserAgeCategorySettings(
      int pigletDays, int weanerDays, int growerDays, int maturedDays) {
    if (pigletDays >= weanerDays) {
      throw 'Piglet days should be less than weaner days';
    }
    if (weanerDays >= growerDays) {
      throw 'Weaners days should be less than Growers days';
    }
    if (growerDays >= maturedDays) {
      throw 'Grower days should be less than matured days';
    }

    return API.patch('/users/category/settings', {
      'piglet': pigletDays,
      'weaner': weanerDays,
      'grower': growerDays,
      'matured': maturedDays
    });
  }
}
