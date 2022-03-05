import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karawang_env/ui/screen/login/login_screen.dart';
import 'package:karawang_env/ui/screen/welcome_screen.dart';
import 'package:karawang_env/ui/widget/navbar.dart';
import 'package:karawang_env/utils/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase/supabase.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUser = false;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(isUser),
    );
  }

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isUser') != null) {
      setState(() {
        isUser = prefs.getBool('isUser')!;
      });
    }
  }
}
