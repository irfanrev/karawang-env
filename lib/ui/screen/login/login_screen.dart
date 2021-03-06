import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karawang_env/controllers/auth_controller.dart';
import 'package:karawang_env/ui/screen/home/home_screen.dart';
import 'package:karawang_env/ui/screen/register/register_screen.dart';
import 'package:karawang_env/utils/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase/supabase.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authC = Get.put(AuthController());
  var emailLogin = TextEditingController();
  var passLogin = TextEditingController();

  final supabase = SupabaseClient('https://gerjjcnprrhywygrzmku.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdlcmpqY25wcnJoeXd5Z3J6bWt1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY0NjI4ODAyNCwiZXhwIjoxOTYxODY0MDI0fQ.cpxf3roMO0rLIvBd6-qROtSM9SQWO-yBvoNwuR9bNQ0');

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
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool('isUser', true);

      final res = await supabase.auth
          .signIn(email: emailLogin.text, password: passLogin.text);

      final user = res.data?.user;
      final error = res.error;

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => LoadingScreen()));
      emailLogin.text = '';
      passLogin.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  child: Image.asset(
                    'assets/img/login.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome, please login!',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: emailLogin,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: Icon(Icons.person),
                      hintText: 'email'),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: passLogin,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: Icon(Icons.security),
                      hintText: 'password'),
                ),
                SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  onPressed: () => login(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => Get.to(RegisScreen(),
                      transition: Transition.rightToLeftWithFade),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'Register',
                        style: GoogleFonts.poppins(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
