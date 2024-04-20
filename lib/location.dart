// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   String locationMessage = 'This is the current location';
//   late String lat;
//   late String long;

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
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Find Bike'),
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               Text(locationMessage),
//               ElevatedButton(
//                   onPressed: () {
//                     _getcurrentloc().then((value) {
//                       lat = '${value.latitude}';
//                       long = '${value.longitude}';
//                       setState(() {
//                         locationMessage = 'Lattitude: $lat  Longitude: $long';
//                       });
//                     });
//                   },
//                   child: Text('Current location')),
//               ElevatedButton(
//                   onPressed: () {
//                     _getcurrentloc().then((value) {
//                       lat = '${value.latitude}';
//                       long = '${value.longitude}';
//                       setState(() {
//                         locationMessage = 'Lattitude: $lat  Longitude: $long';
//                       });
//                     });
//                     _openMap(lat, long);
//                   },
//                   child: Text('Show in map'))
//             ],
//           ),
//         ));
//   }
// }
