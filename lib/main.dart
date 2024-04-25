import 'package:ecommerce_flutter/app.dart';
import 'package:ecommerce_flutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  //     .then((FirebaseApp app) => Get.put(AuthenticaitonRepository()));
  runApp(const MyApp());
}
