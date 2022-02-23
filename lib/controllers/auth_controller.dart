import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karawang_env/ui/screen/home/home_screen.dart';

class AuthController extends GetxController {
  var regEmail = TextEditingController();
  var regPassword = TextEditingController();
  var regRePassword = TextEditingController();

  void register() {
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
      Get.to(HomeScreen());
      regEmail.text = '';
      regPassword.text = '';
      regRePassword.text = '';
    }
  }
}
