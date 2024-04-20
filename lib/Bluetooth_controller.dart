// // THIS IS THE WORKING ONE

import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BleController extends GetxController {
  FlutterBlue ble = FlutterBlue.instance;

  Future scanDevices() async {
    if (await Permission.bluetoothScan.request().isGranted) {
      if (await Permission.bluetoothConnect.request().isGranted) {
        ble.startScan(timeout: Duration(seconds: 10));

        ble.stopScan();
      }
    }
  }

  Future connectToDevice(BluetoothDevice device) async {
    print(device);

    await device.connect(timeout: Duration(seconds: 15));

    device.state.listen((isConnected) {
      if (isConnected == BluetoothDeviceState.connecting) {
        print("device is connecting");
      } else if (isConnected == BluetoothDeviceState.connected) {
        print("device is connected");
      } else {
        print("device is disconnected");
      }
    });
  }

  Stream<List<ScanResult>> get ScanResults => ble.scanResults;
}

// //SECOND METHOD
// // import 'package:flutter_blue/flutter_blue.dart';
// // import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// // import 'package:get/get.dart';
// // import 'package:permission_handler/permission_handler.dart';

// // class BleController extends GetxController {
// //   FlutterBlue ble = FlutterBlue.instance;

// //   Future<void> scanDevices() async {
// //     if (await Permission.bluetoothScan.request().isGranted) {
// //       if (await Permission.bluetoothConnect.request().isGranted) {
// //         ble.startScan(timeout: Duration(seconds: 10));

// //         // You can handle scan results here if needed
// //         ble.scanResults.listen((results) {
// //           // Process scan results
// //         });

// //         // Stop scanning after a certain duration
// //         await Future.delayed(Duration(seconds: 10));
// //         ble.stopScan();
// //       }
// //     }
// //   }

// //   Future<void> connectToDevice(BluetoothDevice device) async {
// //     print(device);

// //     await device.connect(timeout: Duration(seconds: 15));

// //     device.state.listen((isConnected) {
// //       if (isConnected == BluetoothDeviceState.connecting) {
// //         print("Device is connecting");
// //       } else if (isConnected == BluetoothDeviceState.connected) {
// //         print("Device is connected");
// //       } else {
// //         print("Device is disconnected");
// //       }
// //     });
// //   }

// //   Stream<List<ScanResult>> get scanResults => ble.scanResults;
// // }



// // import 'package:flutter/material.dart';
// // import 'package:flutter_blue/flutter_blue.dart';
// // import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// // class BleScanner extends StatefulWidget {
// //   @override
// //   _BleScannerState createState() => _BleScannerState();
// // }

// // class _BleScannerState extends State<BleScanner> {
// //   FlutterBlue flutterBlue = FlutterBlue.instance;
// //   List<BluetoothDevice> devices = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     startScanning();
// //   }

// //   void startScanning() async {
// //     await flutterBlue.startScan();
// //     flutterBlue.scanResults.listen((results) {
// //       for (ScanResult result in results) {
// //         if (!devices.contains(result.device)) {
// //           setState(() {
// //             devices.add(result.device);
// //           });
// //         }
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('BLE Scanner'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: devices.length,
// //         itemBuilder: (context, index) {
// //           return ListTile(
// //             title: Text(devices[index].name),
// //             subtitle: Text(devices[index].id.toString()),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     flutterBlue.stopScan();
// //     super.dispose();
// //   }
// // }
