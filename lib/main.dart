import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_nest/component/Service_tile.dart';
import 'package:social_nest/pages/HomePage.dart';
import 'package:social_nest/component/locations.dart';
import 'package:social_nest/pages/Services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
