import 'package:pig_keep/Api/api.dart';

class FarmApi {
  static createFarm(String farmName, String address) {
    return API.post(
        '/farms/my-farms', {"farm_name": farmName, "farm_address": address});
  }

  static getMyFarms() {
    print('TEST FARM API');
    return API.get('/farms/my-farms');
  }
}
