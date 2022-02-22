import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karawang_env/ui/screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 5),
        ),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Get.to(WelcomeScreen());
          }
          return Center(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.grey,
            ),
          );
        }),
      ),
    );
  }
}
