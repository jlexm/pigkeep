import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  // Singleton instance
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

  // Show success toast
  void showSuccessToast(String message) {
    showToast(
      message,
      backgroundColor: Colors.green, // Success color
      textColor: Colors.white,
    );
  }

  // Show error toast
  void showErrorToast(String message) {
    showToast(
      message,
      backgroundColor: Colors.red, // Error color
      textColor: Colors.white,
    );
  }

  // Show warning toast
  void showWarningToast(String message) {
    showToast(message,
        backgroundColor: Colors.orange, // Warning color
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG);
  }

  // Show neutral toast
  void showNeutralToast(String message) {
    showToast(message,
        backgroundColor: Colors.grey, // Neutral color
        textColor: Colors.white,
        gravity: ToastGravity.TOP);
  }
}
