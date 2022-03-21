import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase/supabase.dart';

import '../ui/screen/report/report_screen.dart';

class LogicController extends GetxController {
  final supabase = SupabaseClient('https://gerjjcnprrhywygrzmku.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdlcmpqY25wcnJoeXd5Z3J6bWt1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY0NjI4ODAyNCwiZXhwIjoxOTYxODY0MDI0fQ.cpxf3roMO0rLIvBd6-qROtSM9SQWO-yBvoNwuR9bNQ0');

  void submitReport() {
    

    Get.defaultDialog(
      title: 'Submit Success!',
      titleStyle: TextStyle(
        color: Colors.green,
        fontSize: 25,
      ),
      radius: 15.0,
      content: Container(
        width: 200,
        height: 200,
        child: Lottie.asset('assets/lottie/success.json'),
      ),
      textConfirm: 'Ok',
      onConfirm: () => Get.offAll(ReportScreen()),
    );
  }
}
