import 'package:flutter/material.dart';
// import 'splash.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationItem(
              title: 'Warning: Low Battery',
              message: 'Your helmet battery is running low. Please recharge.',
              timestamp: '2 hours ago',
            ),
            NotificationItem(
              title: 'Emergency SOS Alert',
              message:
                  'Emergency SOS button was triggered. Check user\'s safety.',
              timestamp: '4 hours ago',
            ),
            NotificationItem(
              title: 'Helmet Disconnected',
              message:
                  'Your smart helmet is currently disconnected from the app.',
              timestamp: '1 day ago',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String timestamp;

  NotificationItem({
    required this.title,
    required this.message,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set the text color to white
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[300],
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            timestamp,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[400],
            ),
          ),
          Divider(
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
