
import 'package:app_coures/Screens/home_screen.dart';
import 'package:flutter/material.dart';
// import 'package:app_coures/Screens/splash_screen.dart';
// import 'package:app_coures/Screens/reward_screen.dart';
// import 'package:app_coures/Screens/register_screen.dart';
import 'package:app_coures/Screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:  SchedulePickup(),

    );
  }
}
