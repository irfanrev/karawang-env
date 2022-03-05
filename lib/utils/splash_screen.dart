import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karawang_env/controllers/auth_controller.dart';
import 'package:karawang_env/controllers/share_prefs.dart';
import 'package:karawang_env/ui/screen/home/home_screen.dart';
import 'package:karawang_env/ui/screen/login/login_screen.dart';
import 'package:karawang_env/ui/screen/welcome_screen.dart';
import 'package:karawang_env/ui/widget/navbar.dart';

class SplashScreen extends StatefulWidget {
  final bool isUser;
  SplashScreen(this.isUser);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (c) => widget.isUser ? NavBar() : LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.grey,
        ),
      ),
    );
  }
}
