import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pig_keep/Api/farm_api.dart';
import 'package:pig_keep/Services/navigation-service.dart';
import 'package:pig_keep/Services/network-service.dart';
import 'package:pig_keep/Store/auth_storage.dart';

class GlobalProvider with ChangeNotifier {
  late List<Map<String, dynamic>> userFarms = [];

  Future<void> fetchFarms() async {
    try {
      userFarms = [];

      // get userFarms from local storage
      String? userFarmsString = await AuthStorage.getUserFarms();
      if (userFarmsString != null) {
        List<dynamic> decodedFarms = jsonDecode(userFarmsString);
        userFarms = decodedFarms.cast<Map<String, dynamic>>();
      }

      if (await NetworkService.checkInternetConnection()) {
        // get farms from api
        final farms = await FarmApi.getMyFarms();

        // check if farms from api does not yet exists in local storage,
        // then add it
        for (var farm in farms) {
          if (!userFarms.any((e) => e['_id'] == farm['_id'])) {
            userFarms.add({
              'farm_name': farm['farm_name'],
              '_id': farm['_id'],
              'owner_id': farm['owner_id'],
              'farm_address': farm['farm_address']
            });
          }
        }
      }

      // when farm is empty show create farm screen
      if (userFarms.isEmpty) {
        navigationService.navigateTo('/create-farm');
        return;
      }

      // check if farm already have selected farm.
      // if none, then make first as selected
      if (!userFarms.any((f) => f['is_selected'] != null && f['is_selected'])) {
        userFarms[0]['is_selected'] = true;
      }
      // save farms to local
      await AuthStorage.setUserFarms(jsonEncode(userFarms));

      notifyListeners();
    } catch (err) {
      print('ERROR RCVC');
      print(err);
    }
  }

  List<Map<String, dynamic>> getFarms() {
    return userFarms;
  }

  Future<void> setSelectedFarm(Map<String, dynamic>? farm) async {
    if (farm == null) {
      return;
    }
    userFarms = userFarms.map((f) {
      if (f['_id'] == farm['_id']) {
        return {...farm, 'is_selected': true};
      }
      f.remove('is_selected');
      return f;
    }).toList();
    await AuthStorage.setUserFarms(jsonEncode(userFarms));
    notifyListeners();
  }

  Future<void> reloadCurrentFarm() async {
    var farm = getSelectedFarm();
    await setSelectedFarm(farm);
  }

  Map<String, dynamic>? getSelectedFarm() {
    if (userFarms.isEmpty) {
      return null;
    }

    return userFarms
        .firstWhere((f) => f['is_selected'] != null && f['is_selected']);
    ;
  }

  Future<dynamic> getCurrentUser() async {
    final user = await AuthStorage.getUser();
    if (user == null) {
      return null;
    }
    return jsonDecode(user);
  }
}
