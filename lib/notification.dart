import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';

import 'firebase_options.dart';

Future<void> initNotification () async {

  //ask for permission

  final permission = await Permission.notification.request();
  // print(permission.isGranted);
  if(permission.isDenied) {
    openAppSettings();
  }

  //initialize firebase options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //to get token
  FirebaseMessaging.instance.getToken().then((value) {
    print(value);
  });

  // FirebaseMessaging.onMessageOpenedApp.listen((msg) {
  //   print(
  //     msg.data,
  //   );
  // });

  FirebaseMessaging.onMessage.listen((event) {
    print(
      event.data,
    );
  });
}