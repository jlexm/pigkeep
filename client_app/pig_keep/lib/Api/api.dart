import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pig_keep/Services/network-service.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/Store/app_config.dart';
import 'dart:convert';
import 'package:pig_keep/Store/auth_storage.dart';

class API {
  static const Duration timeoutDuration =
      Duration(seconds: 60); // Timeout duration

  static handleHTTPResponse(dynamic response) {
    dynamic body = jsonDecode(response.body);
    // Check for successful responses (2xx range)
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    } else {
      // Throw an error for non-successful status codes
      dynamic errMessage = body['message'];
      if (errMessage is String) {
        throw errMessage;
      } else {
        throw errMessage[0];
      }
    }
  }

  static get(String endpoint) async {
    if (!await NetworkService.checkInternetConnection()) {
      throw 'It seems you have lost internet connection...';
    }
    String? token = await AuthStorage.getToken();
    final res = await http.get(Uri.parse(AppConfig.baseAPIEndpoint! + endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer ${token ?? ''}'
        }).timeout(timeoutDuration);
    return handleHTTPResponse(res);
  }

  static post(String endpoint, Map<String, dynamic> body) async {
    if (!await NetworkService.checkInternetConnection()) {
      throw 'It seems you have lost internet connection...';
    }
    String? token = await AuthStorage.getToken();
    final res = await http
        .post(
          Uri.parse(AppConfig.baseAPIEndpoint! + endpoint),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'bearer ${token ?? ''}'
          },
          body: jsonEncode(body),
        )
        .timeout(timeoutDuration);
    return handleHTTPResponse(res);
  }

  static patch(String endpoint, Map<String, dynamic> body) async {
    if (!await NetworkService.checkInternetConnection()) {
      throw 'It seems you have lost internet connection...';
    }
    String? token = await AuthStorage.getToken();

    final res = await http.patch(
      Uri.parse(AppConfig.baseAPIEndpoint! + endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'bearer ${token ?? ''}'
      },
      body: jsonEncode(body),
    );
    return handleHTTPResponse(res);
  }

  static delete(String endpoint) async {
    if (!await NetworkService.checkInternetConnection()) {
      throw 'It seems you have lost internet connection...';
    }
    String? token = await AuthStorage.getToken();

    final res = await http.delete(
      Uri.parse(AppConfig.baseAPIEndpoint! + endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'bearer ${token ?? ''}'
      },
    ).timeout(timeoutDuration);
    return handleHTTPResponse(res);
  }
}
