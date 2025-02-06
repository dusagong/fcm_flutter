import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

//Permission!
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true, //알람수신 ㅇㅋ?
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permission_Granted');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('Provisional_Permission_Granted');
    } else {
      print('Permission Denied');
    }
  }

  Future<String> getDeviceToken() async {
    String? fcmToken = await messaging.getToken();
    return fcmToken!;
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.title.toString());
      print(message.notification!.body.toString());
      showNotification(message);
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
            Random.secure().nextInt(10000).toString(), 'Flutter Notification',
            importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(androidNotificationChannel.id.toString(),
            androidNotificationChannel.name.toString(),
            channelDescription: 'cc',
            icon: '@mipmap/ic_launcher',
            importance: Importance.high,
            ticker: 'ticker');

    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }
  // void initLocalNotifications(
  //     BuildContext context, RemoteMessage message) async {
  //   var androidInitializationSettings =
  //       AndroidInitializationSettings('@mipmap/ic_launcher');
  //   var iosInitializationSettings = DarwinInitializationSettings();

  //   var initializeSettings = InitializationSettings(
  //       android: androidInitializationSettings, iOS: iosInitializationSettings);

  //   await flutterLocalNotificationsPlugin.initialize(initializeSettings,
  //       onDidReceiveNotificationResponse: (payload) {});
  // }
}
