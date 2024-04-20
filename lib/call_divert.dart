import 'package:flutter/material.dart';
// import 'splash.dart';

class CallDivertingPage extends StatefulWidget {
  @override
  _CallDivertingPageState createState() => _CallDivertingPageState();
}

class _CallDivertingPageState extends State<CallDivertingPage> {
  TextEditingController _voiceMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Call Diverting Voice',
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
              'Set Voice Message for Call Diverting:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _voiceMessageController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter voice message for call diverting',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String voiceMessage = _voiceMessageController.text;

                setCallDivertingVoiceMessage(voiceMessage);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                foregroundColor: Colors.white,
              ),
              child: Text('Set Voice Message'),
            ),
          ],
        ),
      ),
    );
  }

  void setCallDivertingVoiceMessage(String voiceMessage) {
    print('Call Diverting Voice Message Set: $voiceMessage');
  }
}
