import 'package:flutter/material.dart';
import 'package:background_sms/background_sms.dart';
import 'package:telephony/telephony.dart' hide SmsStatus;

class StartStopBikePage extends StatefulWidget {
  @override
  _StartStopBikePageState createState() => _StartStopBikePageState();
}

class _StartStopBikePageState extends State<StartStopBikePage> {
  Telephony telephony = Telephony.instance;
  bool isBikeRunning = false;
  String onBike = '';
  String offBike = '';
  void smsBikeStart({required message, required number}) async {
    SmsStatus res =
        await BackgroundSms.sendMessage(phoneNumber: number, message: message);
  }

  void smsBikeStop({required message, required number}) async {
    SmsStatus res =
        await BackgroundSms.sendMessage(phoneNumber: number, message: message);
  }

  @override
  void initState() {
    // TODO: implement initState
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        if (message.body == "Bike is unlocked" &&
            message.address == "+918137938116") {
          setState(() {
            onBike = message.body.toString();
            offBike = '';
          });
          print(onBike);
        } else if (message.body == "Bike is locked" &&
            message.address == "+918137938116") {
          setState(() {
            offBike = message.body.toString();
            onBike = '';
          });
          print(offBike);
        }
      },
      listenInBackground: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Start and Stop Bike',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bike Status:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              isBikeRunning ? 'Running' : 'Stopped',
              style: TextStyle(
                fontSize: 16.0,
                color: isBikeRunning ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isBikeRunning = true;
                  smsBikeStart(message: "bike on", number: "+918137938116");
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text('Start Bike'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isBikeRunning = false;
                  smsBikeStop(message: "bike off", number: "+918137938116");
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text('Stop Bike'),
            ),
            Divider(height: 30),
            Text('Current Status of bike : ${onBike == '' ? offBike : onBike}')
          ],
        ),
      ),
    );
  }
}
