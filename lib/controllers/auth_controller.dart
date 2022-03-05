import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karawang_env/ui/screen/home/home_screen.dart';
import 'package:karawang_env/ui/screen/login/login_screen.dart';
import 'package:karawang_env/utils/loading_screen.dart';
import 'package:supabase/supabase.dart';

class AuthController extends GetxController {
  var regEmail = TextEditingController();
  var regPassword = TextEditingController();
  var regRePassword = TextEditingController();

  var emailLogin = TextEditingController();
  var passLogin = TextEditingController();

  final supabase = SupabaseClient('https://gerjjcnprrhywygrzmku.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdlcmpqY25wcnJoeXd5Z3J6bWt1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY0NjI4ODAyNCwiZXhwIjoxOTYxODY0MDI0fQ.cpxf3roMO0rLIvBd6-qROtSM9SQWO-yBvoNwuR9bNQ0');

  void register() async {
    if (regEmail.text.isEmpty && regPassword.text.isEmpty) {
      Get.snackbar('Error', 'Email dan Password tidak boleh kosong');
      regEmail.text = '';
      regPassword.text = '';
      regRePassword.text = '';
    } else if (regPassword.text.isEmpty && regRePassword.text.isEmpty) {
      Get.snackbar('Error', 'Masukan kembali password anda');
      regEmail.text = '';
      regPassword.text = '';
      regRePassword.text = '';
    } else if (regPassword.text != regRePassword.text) {
      Get.snackbar('Error', 'Password yang anda masukan tidak sama');
      regEmail.text = '';
      regPassword.text = '';
      regRePassword.text = '';
    } else {
      final res = await supabase.auth.signUp(regEmail.text, regPassword.text);

      final user = res.data?.user;
      final error = res.error;
      print(user);
      Get.offAll(LoginScreen());
      regEmail.text = '';
      regPassword.text = '';
      regRePassword.text = '';
    }
  }

  void login() async {
    if (emailLogin.text.isEmpty && passLogin.text.isEmpty) {
      Get.snackbar('Error', 'Email dan Password tidak boleh kosong');
      emailLogin.text = '';
      passLogin.text = '';
    } else if (emailLogin.text.isEmpty || passLogin.text.isEmpty) {
      Get.snackbar('Error', 'Email atau Password tidak boleh kosong');
      emailLogin.text = '';
      passLogin.text = '';
    } else {
      final res = await supabase.auth
          .signIn(email: emailLogin.text, password: passLogin.text);

      final user = res.data?.user;
      final error = res.error;
      print(user);
      Get.offAll(LoadingScreen(), transition: Transition.rightToLeft);
      emailLogin.text = '';
      passLogin.text = '';
    }
  }
}
