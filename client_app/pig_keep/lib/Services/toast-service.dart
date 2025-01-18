import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static final ToastService _instance = ToastService._internal();

  factory ToastService() => _instance;

  ToastService._internal();

  void showToast(String message,
      {ToastGravity gravity = ToastGravity.BOTTOM,
      Color? backgroundColor,
      Color? textColor,
      Toast toastLength = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? Colors.black,
      textColor: textColor ?? Colors.white,
      fontSize: 16.0,
    );
  }

  void showSuccessToast(String message) {
    showToast(
      message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  void showErrorToast(String message) {
    showToast(
      message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  void showWarningToast(String message) {
    showToast(message,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG);
  }

  void showNeutralToast(String message) {
    showToast(message,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        gravity: ToastGravity.TOP);
  }
}
