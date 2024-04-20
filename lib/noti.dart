import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:helmet/home.dart';

class noti {
  static Future initializeNoti(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = new AndroidInitializationSettings('mipmap/helmet');
    var initializationSettings =
        new InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecific =
        new AndroidNotificationDetails('Number_1', 'Channel_1',
            playSound: true,
            sound: RawResourceAndroidNotificationSound('voice'),
            importance: Importance.max,
            priority: Priority.max);

    var not = NotificationDetails(android: androidPlatformChannelSpecific);
    await fln.show(0, title, body, not);
  }

  static Future speedNotification(
      {var id = 1,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecific =
        new AndroidNotificationDetails('Number_2', 'Channel_1',
            playSound: true,
            sound: RawResourceAndroidNotificationSound('overspeedvoice'),
            importance: Importance.max,
            priority: Priority.max);

    var snd = NotificationDetails(android: androidPlatformChannelSpecific);
    await fln.show(1, title, body, snd);
  }
}
