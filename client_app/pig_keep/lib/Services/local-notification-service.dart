import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart';

class LocalNotificationService {
  static const String DEFAULT_CHANNEL_ID = 'pigkeep_notification';
  static const String DEFAULT_CHANNEL = 'PigKeep Notification';

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> setup() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap
        print('Notification tapped with payload: ${response.payload}');
      },
    );
    await requestNotificationPerms();
  }

  static Future<void> showSingle(
      {required String title,
      required body,
      Importance importance = Importance.defaultImportance,
      Priority prio = Priority.defaultPriority}) async {
    try {
      AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        DEFAULT_CHANNEL_ID, // Channel ID
        DEFAULT_CHANNEL, // Channel name
        importance: importance,
        priority: prio,
      );

      NotificationDetails notificationDetails =
          NotificationDetails(android: androidDetails);

      final scheduleTime = TZDateTime.now(local).add(Duration(seconds: 60));
      print(scheduleTime);
      int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      await flutterLocalNotificationsPlugin.zonedSchedule(
          notificationId, // Notification ID
          'Test 123', // Notification Title
          body, // Notification Body
          scheduleTime,
          notificationDetails,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.wallClockTime,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle);
      await flutterLocalNotificationsPlugin.show(
          notificationId, // Notification ID
          'Test 123', // Notification Title
          body, // Notification Body
          notificationDetails);
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> requestNotificationPerms() async {
    await Permission.notification.request();
  }
}
