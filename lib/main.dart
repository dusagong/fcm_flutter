import 'package:fcmpractice/firebase_options.dart';
import 'package:fcmpractice/notification/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit();
    notificationServices.getDeviceToken().then((value) {
      print('Device_Token:-');
      print(value);
    }); //토큰받아오기
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
