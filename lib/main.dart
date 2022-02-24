import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'app/agora_video/views/pickUp_view.dart';
import 'app/constants/global_var.dart';
import 'app/routes/app_pages.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('background message ${message.notification!.body}');
}

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await GetStorage.init();
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  // FirebaseMessaging.onMessageOpenedApp;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  firebaseMessaging.getToken().then((value) {
    GlobalVar.global.deviceToken = value.toString();
    print(value.toString());
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ));
    }
  });
  FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    print("message recieved");
    print(event.notification!.body);

    Get.to(PickUpView());
    // Get.back();
  });
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    print('Message clicked!');
  });
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0XFF502E9A),
        ),
        fontFamily: 'Roboto',
        primaryColor: Color(0XFF502E9A),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

// class DiscoveryPage extends StatefulWidget {
//   /// If true, discovery starts on page start, otherwise user must press action button.
//   final bool start;

//   const DiscoveryPage({this.start = true});

//   @override
//   _DiscoveryPage createState() => new _DiscoveryPage();
// }

// class _DiscoveryPage extends State<DiscoveryPage> {
//   StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
//   List<BluetoothDiscoveryResult> results =
//       List<BluetoothDiscoveryResult>.empty(growable: true);
//   bool isDiscovering = false;

//   _DiscoveryPage();

//   @override
//   void initState() {
//     super.initState();

//     isDiscovering = widget.start;
//     if (isDiscovering) {
//       _startDiscovery();
//     }
//   }

//   void _restartDiscovery() {
//     setState(() {
//       results.clear();
//       isDiscovering = true;
//     });

//     _startDiscovery();
//   }

//   void _startDiscovery() {
//     _streamSubscription =
//         FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
//       setState(() {
//         final existingIndex = results.indexWhere(
//             (element) => element.device.address == r.device.address);
//         if (existingIndex >= 0)
//           results[existingIndex] = r;
//         else
//           results.add(r);
//       });
//     });

//     _streamSubscription!.onDone(() {
//       setState(() {
//         isDiscovering = false;
//       });
//     });
//   }

//   // @TODO . One day there should be `_pairDevice` on long tap on something... ;)

//   @override
//   void dispose() {
//     // Avoid memory leak (`setState` after dispose) and cancel discovery
//     _streamSubscription?.cancel();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: isDiscovering
//             ? Text('Discovering devices')
//             : Text('Discovered devices'),
//         actions: <Widget>[
//           isDiscovering
//               ? FittedBox(
//                   child: Container(
//                     margin: new EdgeInsets.all(16.0),
//                     child: CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     ),
//                   ),
//                 )
//               : IconButton(
//                   icon: Icon(Icons.replay),
//                   onPressed: _restartDiscovery,
//                 )
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: results.length,
//         itemBuilder: (BuildContext context, index) {
//           BluetoothDiscoveryResult result = results[index];
//           final device = result.device;
//           final address = device.address;

//           return BluetoothDeviceListEntry(
//             device: device,
//             rssi: result.rssi,
//             onTap: () {
//               Navigator.of(context).pop(result.device);
//             },
//             onLongPress: () async {
//               try {
//                 bool bonded = false;
//                 if (device.isBonded) {
//                   print('Unbonding from ${device.address}...');
//                   await FlutterBluetoothSerial.instance
//                       .removeDeviceBondWithAddress(address);
//                   print('Unbonding from ${device.address} has succed');
//                 } else {
//                   print('Bonding with ${device.address}...');
//                   bonded = (await FlutterBluetoothSerial.instance
//                       .bondDeviceAtAddress(address))!;
//                   print(
//                       'Bonding with ${device.address} has ${bonded ? 'succed' : 'failed'}.');
//                 }
//                 setState(() {
//                   results[results.indexOf(result)] = BluetoothDiscoveryResult(
//                       device: BluetoothDevice(
//                         name: device.name ?? '',
//                         address: address,
//                         type: device.type,
//                         bondState: bonded
//                             ? BluetoothBondState.bonded
//                             : BluetoothBondState.none,
//                       ),
//                       rssi: result.rssi);
//                 });
//               } catch (ex) {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: const Text('Error occured while bonding'),
//                       content: Text("${ex.toString()}"),
//                       actions: <Widget>[
//                         new TextButton(
//                           child: new Text("Close"),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }
