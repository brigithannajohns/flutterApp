import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'Bluetooth_controller.dart';

//THIS IS THE WORKING MODEL
class device extends StatefulWidget {
  const device({Key? key}) : super(key: key);

  @override
  State<device> createState() => _deviceState();
}

class _deviceState extends State<device> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Connect Devices',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: GetBuilder<BleController>(
        init: BleController(),
        builder: (BleController controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<List<ScanResult>>(
                  stream: controller.ScanResults,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return SizedBox(
                        height: 200, // Example height, adjust as needed
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data![index];
                            return Card(
                              elevation: 2,
                              child: ListTile(
                                title: Text(
                                  data.device.name == ""
                                      ? 'Unknown Device'
                                      : data.device.name,
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(data.device.id.id),
                                trailing: Text(data.rssi.toString()),
                                onTap: () =>
                                    controller.connectToDevice(data.device),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: Text("No Devices found. "),
                      );
                    }
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => controller.scanDevices(),
                  child: Text("SCAN"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';

// class BluetoothDeviceListScreen extends StatefulWidget {
//   @override
//   _BluetoothDeviceListScreenState createState() =>
//       _BluetoothDeviceListScreenState();
// }

// class _BluetoothDeviceListScreenState extends State<BluetoothDeviceListScreen> {
//   final FlutterBlue flutterBlue = FlutterBlue.instance;
//   List<BluetoothDevice> devices = [];

//   @override
//   void initState() {
//     super.initState();
//     _startScanning();
//   }

//   void _startScanning() {
//     flutterBlue.startScan(timeout: Duration(seconds: 4));
//     flutterBlue.scanResults.listen((results) {
//       for (ScanResult result in results) {
//         if (!devices.contains(result.device)) {
//           setState(() {
//             devices.add(result.device);
//           });
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bluetooth Devices'),
//       ),
//       body: ListView.builder(
//         itemCount: devices.length,
//         itemBuilder: (context, index) {
//           final device = devices[index];
//           return ListTile(
//             title: Text(
//               device.name == "" ? 'Unknown Device' : device.name,
//               style: TextStyle(color: Colors.black),
//             ),
//             subtitle: Text(device.id.toString()),
//             // Add any other relevant information you want to display
//             onTap: () {
//               // Handle device selection or connection here
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// void main() => runApp(MaterialApp(home: BluetoothDeviceListScreen()));


//NEW ONE
// class device extends StatefulWidget {
//   const device({super.key});

//   @override
//   State<device> createState() => _deviceState();
// }

// class _deviceState extends State<device> {
//   List<BluetoothDevice> devicesList = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bluetooth Scanner'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Call a function to start scanning for nearby Bluetooth devices
//                 startScan();
//               },
//               child: Text('Scan'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: devicesList.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(devicesList[index].name ?? 'Unknown Device'),
//                     onTap: () {
//                       // Handle tapping on a device
//                       connectToDevice(devicesList[index]);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void startScan() {
//     FlutterBlue flutterBlue = FlutterBlue.instance;

//     flutterBlue.startScan(timeout: Duration(seconds: 4));

//     flutterBlue.scanResults.listen((results) {
//       for (ScanResult r in results) {
//         if (!devicesList.contains(r.device)) {
//           setState(() {
//             devicesList.add(r.device);
//           });
//         }
//       }
//     });
//   }

//   void connectToDevice(BluetoothDevice device) async {
//     // Show a dialog prompting the user to connect to the device
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Connect to ${device.name}?'),
//           content: Text('Would you like to connect to this device?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context); // Close the dialog
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 Navigator.pop(context); // Close the dialog
//                 // Connect to the selected device
//                 await device.connect();
//                 // Handle further actions after connection
//               },
//               child: Text('Connect'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
