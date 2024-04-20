// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sms_mms/sms_mms.dart';
import 'package:telephony/telephony.dart' hide SmsStatus;
import 'package:url_launcher/url_launcher_string.dart';
import 'package:background_sms/background_sms.dart';

class WhereIsMyBikePage extends StatefulWidget {
  @override
  State<WhereIsMyBikePage> createState() => _WhereIsMyBikePageState();
}

class _WhereIsMyBikePageState extends State<WhereIsMyBikePage> {
  String sms = "";
  Telephony telephony = Telephony.instance;
  String lat = '';
  String long = '';
  List<String> locationArray = [];

  @override
  void initState() {
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        if (message.address == "+918137938116") {
          print(message.address);
          print(message.body);
          print(message.date);
          locationArray = message.body!.split(",");
          lat = locationArray[0];
          long = locationArray[1];
          print(lat);
          print(long);
          setState(() {
            sms = message.body.toString();
          });
        }
      },
      listenInBackground: false,
    );
    super.initState();
  }

  // void _sendSms() async {
  //   try {
  //     await SmsMms.send(
  //         message: "hello testing testing.", recipients: ["7909297011"]);
  //     print("SMS sent successfully");
  //   } catch (error) {
  //     print("Error sending SMS: $error");
  //   }
  // }

  Future<void> _openMap(String lat, String long) async {
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw 'could not launch $googleURL';
  }

  void smsFunction({required message, required number}) async {
    SmsStatus res =
        await BackgroundSms.sendMessage(phoneNumber: number, message: message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Where is My Bike?'),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () async {
                  if (await Permission.sms.isGranted) {
                    smsFunction(
                        message: 'send location', number: '+918137938116');
                  } else {
                    final status = await Permission.sms.request();
                    if (status.isGranted) {
                      smsFunction(
                          message: 'send location', number: '+918137938116');
                    }
                  }
                  // smsFunction(message, number);
                } /*_sendSms*/,
                child: Text("Bike location")),
            SizedBox(height: 8.0),
            Text(
              'Latitude: ${lat}, Longitude: ${long}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            Divider(),
            SizedBox(height: 16.0),
            if (lat != "" && long != "")
              ElevatedButton(
                onPressed: () {
                  _openMap(lat, long);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                ),
                child: Text('Track Bike on Map'),
              ),
          ],
        ),
      ),
    );
  }
}
