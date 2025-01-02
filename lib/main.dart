import 'package:flutter/material.dart';
import 'screen/splash/splash_screen.dart';
import 'screen/admin_splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminSplashScreen(),
    );
  }
}
