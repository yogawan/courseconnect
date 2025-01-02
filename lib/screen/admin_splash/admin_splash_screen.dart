import 'package:courseconnect/screen/admin_auth/admin_login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AdminSplashScreen extends StatefulWidget {
  @override
  _AdminSplashScreenState createState() => _AdminSplashScreenState();
}

class _AdminSplashScreenState extends State<AdminSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AdminLoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 390,
          height: 390,
        ),
      ),
    );
  }
}