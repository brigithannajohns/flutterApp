import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helmet/devices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget {
  final String? User;
  final String? Mail;

  ProfilePage({required this.User, required this.Mail});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[800],
              child: Icon(
                Icons.account_circle,
                size: 100.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '${widget.User}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '${widget.Mail}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Helmet ID: 123456',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Status: Connected',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => device()));
              },
              child: Text(
                'Add Device',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                } else {
                  return Colors.black;
                }
              })),
            ),
            SizedBox(height: 24.0),
            Divider(
              color: Colors.grey[600],
              thickness: 1.0,
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('Distance Traveled',
                  style: TextStyle(color: Colors.black)),
              subtitle:
                  Text('250 km', style: TextStyle(color: Colors.grey[600])),
            ),
            ListTile(
              title:
                  Text('Average Speed', style: TextStyle(color: Colors.black)),
              subtitle:
                  Text('30 km/h', style: TextStyle(color: Colors.grey[600])),
            ),
            SizedBox(height: 24.0),
            Divider(
              color: Colors.grey[600],
              thickness: 1.0,
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('Current Location',
                  style: TextStyle(color: Colors.black)),
              subtitle: Text('Latitude: 37.7749, Longitude: -122.4194',
                  style: TextStyle(color: Colors.grey[600])),
            ),
            SizedBox(height: 24.0),
            Divider(
              color: Colors.grey[600],
              thickness: 1.0,
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('Notification Preferences',
                  style: TextStyle(color: Colors.black)),
              subtitle: Text('Receive warnings and alerts',
                  style: TextStyle(color: Colors.grey[600])),
            ),
            ListTile(
              title: Text('Call Diverting Preferences',
                  style: TextStyle(color: Colors.black)),
              subtitle: Text('Divert calls in emergency situations',
                  style: TextStyle(color: Colors.grey[600])),
            ),
            ElevatedButton(
              onPressed: () async {
                final SharedPreferences shp =
                    await SharedPreferences.getInstance();
                shp.remove('email');
                shp.remove('pass');
                // shp.remove('user');
                FirebaseAuth.instance.signOut().then((value) async {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => login_page()));
                  print('Signed Out');
                });
              },
              child: Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                } else {
                  return Colors.black;
                }
              })),
            ),
          ],
        ),
      ),
    );
  }
}
