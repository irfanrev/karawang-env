import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supabase/supabase.dart';

class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final client = SupabaseClient('https://gerjjcnprrhywygrzmku.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdlcmpqY25wcnJoeXd5Z3J6bWt1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY0NjI4ODAyNCwiZXhwIjoxOTYxODY0MDI0fQ.cpxf3roMO0rLIvBd6-qROtSM9SQWO-yBvoNwuR9bNQ0');

  Future<dynamic> getData() async {
    final response = await client.from('tips').select().execute();
    print(response);
    dynamic data = response.data;
    return data;
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
            Expanded(
              child: Container(
                width: Get.width,
                height: Get.height,
                child: FutureBuilder<dynamic>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                                child: Container(
                                  width: Get.width,
                                  height: 50,
                                ),
                                baseColor: Colors.red,
                                highlightColor: Colors.white);
                          });
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              snapshot.data[index]['title'],
                              style: GoogleFonts.poppins(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios_rounded)),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
