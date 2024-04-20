// import 'package:flutter/material.dart';
// import 'package:helmassist/call_diverting_page.dart';
// import 'package:helmassist/notifications.dart';
// import 'package:helmassist/profile.dart';
// import 'package:helmassist/sos_message_page.dart';
// import 'package:helmassist/start_stop_bike.dart';
// import 'package:helmassist/where_is_my_bike.dart';
// class GradientBackground extends StatelessWidget {
//   final Widget child;

//   GradientBackground({required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color.fromARGB(255, 166, 170, 175), Color.fromARGB(255, 103, 103, 103)],
//         //[Color.fromARGB(255, 166, 170, 175), Color.fromARGB(190, 166, 170, 175)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: child,
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primaryColor: const Color.fromARGB(255, 32, 33, 33),
//         hintColor: Colors.pink,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: GradientBackground(
//         child: HomePage(),
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Helmassist'),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.account_circle,
//               size: 37.0,
//               color: Color.fromRGBO(248, 246, 246, 1),
//             ),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));

//             },
//           ),
//         ],
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color.fromARGB(255, 103, 103, 103), Color.fromARGB(255, 103, 103, 103)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: GradientBackground(
//         child: Column(
//           children: [
//             Container(
//               height: 280.0,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/helm.png'), // Replace with your image asset
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: ListView(
//                   children: [
//                     _buildFeatureButton(
//                       context: context,
//                       icon: Icons.location_on,
//                       label: 'Where Is My Bike',
//                       onPressed: () {
//                         Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => WhereIsMyBikePage(),)
//                         );
//                       },
//                     ),

//                     SizedBox(height: 16.0),
//                    _buildFeatureButton(
//                       context: context,
//                       icon: Icons.directions_bike,
//                       label: 'Start/StopBike',
//                       onPressed: () {
//                         Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => StartStopBikePage(),)
//                         );
//                       },
//                     ),
//                   SizedBox(height: 16.0),
//                   _buildFeatureButton(
//                       context: context,
//                       icon: Icons.warning,
//                       label: 'SOS Message',
//                       onPressed: () {
//                         Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => SOSMessagePage(),)
//                         );
//                       },
//                     ),
//                   SizedBox(height: 16.0),
//                   _buildFeatureButton(
//                       context: context,
//                       icon: Icons.call,
//                       label: 'Call Diverting',
//                       onPressed: () {
//                         Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => CallDivertingPage(),)
//                         );
//                       },
//                     ),
//                   SizedBox(height: 16.0),
//                   _buildFeatureButton(
//                       context: context,
//                       icon: Icons.notifications,
//                       label: 'Notifications',
//                       onPressed: () {
//                         Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => NotificationsPage(),)
//                         );
//                       },
//                     ),
//                     // Add more buttons as needed
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFeatureButton({
//   required BuildContext context,
//   required IconData icon,
//   required String label,
//   //required Widget route,
//   required VoidCallback onPressed,
// }) {
//   return Container(
//     width: double.infinity,
//     child: ElevatedButton(
//       onPressed:onPressed,
//         style: ElevatedButton.styleFrom(
//           primary: Colors.grey[800],
//           onPrimary: Colors.white,
//           padding: EdgeInsets.all(20.0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(icon, size: 40.0),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(width: 10.0),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Add more pages using the GradientBackground widget similarly

// void main() {
//   runApp(MyApp());
// }

// import 'package:flutter/material.dart';
// import 'package:helmet/profile_page.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'on_bike.dart';
// import 'sos.dart';
// import 'call_divert.dart';
// import 'notifications.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class HomePage extends StatefulWidget {
//   final String? Username;
//   final String? Email;

//   const HomePage({required this.Username, required this.Email});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String apiKey = 'c43b3056bfb9b0f47f2c6ebd4f675ef0';
//   String city = 'Kochi';
//   String apiUrl =
//       'https://api.openweathermap.org/data/2.5/weather?q=Kochi&appid=c43b3056bfb9b0f47f2c6ebd4f675ef0&units=metric';
//   var weatherData;
//   String day = '';
//   String month = '';
//   String date = '';
//   String locationMessage = 'This is the current location';
//   String lat = '';
//   String long = '';

//   Future<Position> _getcurrentloc() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Permissions not enabled');
//     }

//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('location permissions are denied forever');
//     }
//     return await Geolocator.getCurrentPosition();
//   }

//   void _liveLocation() {
//     LocationSettings locationSettings = const LocationSettings(
//       accuracy: LocationAccuracy.high,
//       distanceFilter: 100,
//     );
//     Geolocator.getPositionStream(locationSettings: locationSettings)
//         .listen((Position position) {
//       lat = position.latitude.toString();
//       long = position.longitude.toString();

//       setState(() {
//         locationMessage = 'Lattitude: $lat  Longitude: $long';
//       });
//     });
//   }

//   Future<void> _openMap(String lat, String long) async {
//     String googleURL =
//         'https://www.google.com/maps/search/?api=1&query=$lat,$long';
//     await canLaunchUrlString(googleURL)
//         ? await launchUrlString(googleURL)
//         : throw 'could not launch $googleURL';
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchWeather();
//     DateTime now = DateTime.now();
//     day = getDayOfWeek(now.weekday);
//     month = getMonth(now.month);
//     date = now.day.toString();
//   }

//   Future<void> fetchWeather() async {
//     var response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       setState(() {
//         weatherData = jsonDecode(response.body);
//       });
//     }
//   }

//   String getDayOfWeek(int day) {
//     switch (day) {
//       case 1:
//         return 'Monday';
//       case 2:
//         return 'Tuesday';
//       case 3:
//         return 'Wednesday';
//       case 4:
//         return 'Thursday';
//       case 5:
//         return 'Friday';
//       case 6:
//         return 'Saturday';
//       case 7:
//         return 'Sunday';
//       default:
//         return '';
//     }
//   }

//   String getMonth(int month) {
//     switch (month) {
//       case 1:
//         return 'January';
//       case 2:
//         return 'February';
//       case 3:
//         return 'March';
//       case 4:
//         return 'April';
//       case 5:
//         return 'May';
//       case 6:
//         return 'June';
//       case 7:
//         return 'July';
//       case 8:
//         return 'August';
//       case 9:
//         return 'September';
//       case 10:
//         return 'October';
//       case 11:
//         return 'November';
//       case 12:
//         return 'December';
//       default:
//         return '';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               color: Colors.white,
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => ProfilePage(
//                             User: widget.Username, Mail: widget.Email)));
//               },
//               icon: Icon(Icons.account_circle))
//         ],
//         backgroundColor: Colors.black,
//         title: Text(
//           'Welcome ${widget.Username}',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(),
//                   color: Colors.grey,
//                 ),
//                 margin: EdgeInsets.all(20),
//                 width: double.infinity,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           '  $day, $month $date',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         SizedBox(width: 90),
//                         if (weatherData != null && weatherData['main'] != null)
//                           Text(
//                             '${weatherData['main']?['temp'] ?? 'N/A'}°C',
//                             style: TextStyle(fontSize: 24, color: Colors.white),
//                           ),
//                       ],
//                     ),
//                     if (weatherData != null)
//                       Text(
//                         '${weatherData['name']}',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                     else
//                       CircularProgressIndicator(),
//                     Row(
//                       children: [
//                         if (weatherData != null &&
//                             weatherData['weather'] != null &&
//                             weatherData['weather'].isNotEmpty)
//                           Image.network(
//                             'http://openweathermap.org/img/wn/${weatherData['weather'][0]['icon']}.png',
//                             scale: 1.5,
//                           ),
//                         SizedBox(width: 8),
//                         Text(
//                           weatherData['weather'][0]['main'],
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )),
//             _buildFeatureButton(
//               context: context,
//               icon: Icons.location_on,
//               label: 'Where Is My Bike',
//               onPressed: () {
//                 _getcurrentloc().then((value) {
//                   lat = '${value.latitude}';
//                   long = '${value.longitude}';
//                   setState(() {
//                     locationMessage = 'Lattitude: $lat  Longitude: $long';
//                     print(locationMessage);
//                   });
//                 });

//                 _openMap(lat, long);
//               },
//             ),
//             SizedBox(height: 16.0),
//             _buildFeatureButton(
//               context: context,
//               icon: Icons.directions_bike,
//               label: 'Start/StopBike',
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => StartStopBikePage(),
//                     ));
//               },
//             ),
//             SizedBox(height: 16.0),
//             _buildFeatureButton(
//               context: context,
//               icon: Icons.warning,
//               label: 'SOS Message',
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SOSMessagePage(),
//                     ));
//               },
//             ),
//             SizedBox(height: 16.0),
//             _buildFeatureButton(
//               context: context,
//               icon: Icons.call,
//               label: 'Call Diverting',
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CallDivertingPage(),
//                     ));
//               },
//             ),
//             SizedBox(height: 16.0),
//             _buildFeatureButton(
//               context: context,
//               icon: Icons.notifications,
//               label: 'Notifications',
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => NotificationsPage(),
//                     ));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFeatureButton({
//     required BuildContext context,
//     required IconData icon,
//     required String label,
//     required VoidCallback onPressed,
//   }) {
//     return Container(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           primary: Colors.grey[800],
//           onPrimary: Colors.white,
//           padding: EdgeInsets.all(20.0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(icon, size: 40.0),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(width: 10.0),
//           ],
//         ),
//       ),
//     );
//   }
// }
