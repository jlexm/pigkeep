import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  static final Connectivity _connectivity = Connectivity();

  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.every((connection) => [
          ConnectivityResult.mobile,
          ConnectivityResult.wifi
        ].contains(connection))) {
      return true;
    } else {
      return false;
    }
  }
}
