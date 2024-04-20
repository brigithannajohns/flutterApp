import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helmet/home.dart';
import 'reusable_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signin_screen extends StatefulWidget {
  const signin_screen({Key? key}) : super(key: key);

  @override
  State<signin_screen> createState() => _signin_screenState();
}

class _signin_screenState extends State<signin_screen> {
  TextEditingController _userTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'SignUp',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.grey.shade800,
            Colors.grey.shade700,
            Colors.grey.shade600,
            Colors.grey.shade500,
            Colors.grey.shade400,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 55, 20, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    reusableTextField('Enter User Name', Icons.person_outline,
                        false, _userTextController),
                    SizedBox(
                      height: 30,
                    ),
                    reusableTextField('Enter Email', Icons.mail_outline, false,
                        _emailTextController),
                    SizedBox(
                      height: 20,
                    ),
                    reusableTextField('Enter Password', Icons.lock_outline,
                        true, _passwordTextController),
                    SizedBox(
                      height: 30,
                    ),
                    signinSignupButton(
                      context,
                      false,
                      () async {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text,
                          );
                          creatuser(context);
                          User? user = userCredential.user;

                          if (user != null) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  Username: _userTextController.text,
                                  Email: _emailTextController.text,
                                ),
                              ),
                            );

                            await FirebaseFirestore.instance
                                .collection('Users')
                                .doc(user.uid)
                                .set({
                              'userName': _userTextController.text,
                              'email': _emailTextController.text,
                            });

                            print(
                                'Username updated successfully. ${_userTextController.text}');
                          } else {
                            print('User is null.');
                          }
                        } catch (e) {
                          print('Error: $e');
                        }
                      },
                    ),
                  ],
                )),
          ),
        ));
  }

  Future<void> creatuser(BuildContext context) async {
    final SharedPreferences shp = await SharedPreferences.getInstance();
    await shp.setString('email', _emailTextController.text);
    await shp.setString('pass', _passwordTextController.text);
    await shp.setString('user', _userTextController.text);
  }
}
