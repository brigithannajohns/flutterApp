import 'dart:io';
// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:helmet/splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDIELpKcxZGacO_g9YblJZwQii-B_8Na3c",
              appId: "1:772475270673:android:2b997be6cdf767ab1923b0",
              messagingSenderId: "772475270673",
              projectId: "helmassist"))
      : await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Helmet_App',
        theme: ThemeData(primaryColor: const Color.fromARGB(255, 88, 88, 88)),
        home: splash_screen());
  }
}
