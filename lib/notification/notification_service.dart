import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

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

  void firebaseInit(){
    FirebaseMessaging.onMessage.listen((message){
      print(message.notification!.title.toString());
      print(message.notification!.body.toString());
    });
  }
}
