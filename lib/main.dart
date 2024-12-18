import 'dart:developer';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:social_nest/component/Service_tile.dart';
import 'package:social_nest/pages/HomePage.dart';
import 'package:social_nest/pages/LoginPage.dart';
import 'package:social_nest/pages/Profile.dart';
import 'package:social_nest/pages/RegisterPage.dart';
import 'package:social_nest/pages/Services.dart';
import 'package:social_nest/pages/Settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBAnkSM-H_yDuqro_Nv_8D2Jw21MNURYNM",
            authDomain: "socialnest-a6723.firebaseapp.com",
            projectId: "socialnest-a6723",
            storageBucket: "socialnest-a6723.firebasestorage.app",
            messagingSenderId: "187036775104",
            appId: "1:187036775104:web:92d274b8913adb2b477325"));
    runApp(const MyApp());
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
