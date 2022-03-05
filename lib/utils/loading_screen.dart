import 'package:flutter/material.dart';
import 'package:karawang_env/ui/screen/home/home_screen.dart';
import 'package:karawang_env/ui/widget/navbar.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return NavBar();
          }
          return Center(
              child: Container(
            width: 250,
            height: 250,
            child: Lottie.asset('assets/lottie/loader.json'),
          ));
        },
      ),
    );
  }
}
