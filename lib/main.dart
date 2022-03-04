import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karawang_env/ui/screen/login/login_screen.dart';
import 'package:karawang_env/ui/screen/welcome_screen.dart';
import 'package:karawang_env/ui/widget/navbar.dart';
import 'package:karawang_env/utils/splash_screen.dart';
import 'package:supabase/supabase.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginScreen(),
    );
  }
}
