import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karawang_env/ui/screen/taman/taman_detail.dart';

class TamanScreen extends StatefulWidget {
  const TamanScreen({Key? key}) : super(key: key);

  @override
  _TamanScreenState createState() => _TamanScreenState();
}

class _TamanScreenState extends State<TamanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Green Place &\nGarden in Karawang',
          style: GoogleFonts.poppins(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
              width: Get.width,
              height: Get.height,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: ((context, index) => GestureDetector(
                      onTap: () => Get.to(TamanDetail()),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                        width: Get.width,
                        child: Row(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey[200],
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Taman I Love Karawang',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('Ini deskripsinya brow'),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey[200],
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        color: Colors.green,
                                      ),
                                      Text('Teluk Jambe, Karawang'),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
