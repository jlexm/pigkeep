import 'package:flutter/material.dart';
import 'package:pig_keep/Api/farm_api.dart';
import 'package:pig_keep/Classes/Farm.dart';
import 'package:pig_keep/Services/navigation-service.dart';
import 'package:pig_keep/Store/auth_storage.dart';

class GlobalProvider with ChangeNotifier {
  List<Farm> _farms = [];
  String? _selectedFarmName;

  Future<void> fetchFarms() async {
    try {
      _farms = [];

      final List<dynamic> farms = await FarmApi.getMyFarms();
      for (var farm in farms) {
        _farms.add(Farm(
            ID: farm['_id'],
            farmName: farm['farm_name'],
            farmAddress: farm['farm_address'],
            ownerID: farm['owner_id']));
      }

      // when farm is empty show create farm screen
      if (farms.isEmpty) {
        navigationService.navigateTo('/create-farm');
      } else {
        // check for selected farm existence
        String? selectedFarmName = await AuthStorage.getSelectedFarmName();
        if (selectedFarmName == null) {
          await AuthStorage.setSelectedFarmName(_farms[0].farmName);
          selectedFarmName = _farms[0].farmName;
        }
        _selectedFarmName = selectedFarmName;
      }
      notifyListeners();
    } catch (err) {
      print('ERROR RCVC');
      print(err);
    }
  }

  // farms
  void setFarm(List<Farm> farms) {
    _farms = farms;
    notifyListeners();
  }

  void addFarm(Farm farm) {
    _farms.add(farm);
    notifyListeners();
  }

  void removeFarm(String farmID) {
    _farms.removeWhere((farm) => farm.ID == farmID);
    notifyListeners();
  }

  List<Farm> getFarms() {
    return _farms;
  }

  String? getSelectedFarm() {
    return _selectedFarmName;
  }

  void setSelectedFarm(String? selectedFarmName) {
    AuthStorage.setSelectedFarmName(selectedFarmName);
    _selectedFarmName = selectedFarmName;

    notifyListeners();
  }
}
