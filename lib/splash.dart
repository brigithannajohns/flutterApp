import 'dart:async';
import 'package:flutter/material.dart';
import 'package:helmet/home.dart';
import 'package:helmet/login.dart';
import 'package:helmet/reusable_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

String? email;
String? Pass;
String? username;

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    dataValidation().whenComplete(() async {
      if (email != null) {
        try {
          QuerySnapshot querySnapshot = await FirebaseFirestore.instance
              .collection('Users')
              .where('email', isEqualTo: email)
              .get();
          if (querySnapshot.docs.isNotEmpty) {
            var userData =
                querySnapshot.docs.first.data() as Map<String, dynamic>;
            username = userData['userName'];
            print('$username$email');
            Timer(
                const Duration(seconds: 1),
                () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              Username: username,
                              Email: email,
                            ))));
          } else {
            print('User not found');
            Timer(
                const Duration(seconds: 1),
                () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => login_page())));
          }
        } catch (e) {
          print('Error: $e');
        }

        print('$username$email');
      }
      if (email == null) {
        Timer(
          const Duration(seconds: 1),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => login_page())),
        );
      }
    });
  }

  Future<void> dataValidation() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    var obtaindeEmail = shp.getString('email');
    var obtainedPass = shp.getString('pass');

    setState(() {
      email = obtaindeEmail;
      Pass = obtainedPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logoImage('assets/images/helmet.jpg'),
            Text(
              'Helmassist',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
