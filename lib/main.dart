import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winter_store/app.dart';
import 'package:winter_store/data/repositories/authentication/authentication_repository.dart';
import 'package:winter_store/firebase_options.dart';

void main() async {
  // Widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Init Storage
  await GetStorage.init();

  // Await Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(((value) => Get.put(AuthenticationRepository())));

  runApp(const App());
}
