import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Tips Menangani Sampah',
            style: GoogleFonts.poppins(
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                  ),
                  hintText: 'Cari informasi di sini',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const Divider(),
            Container(
              width: Get.width,
            ),
          ],
        ));
  }
}
