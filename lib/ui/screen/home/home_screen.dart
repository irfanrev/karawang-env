import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karawang_env/ui/widget/slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                // CircleAvatar(),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Hallo,',
                                          style: GoogleFonts.poppins(
                                            fontSize: 18.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          ' Irfan Maulana',
                                          style: GoogleFonts.poppins(
                                              fontSize: 18.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Selamat Datang!',
                                      style: GoogleFonts.poppins(
                                        fontSize: 19.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.notifications_active_outlined,
                                      color: Colors.lightBlue[400],
                                      size: 28,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SliderWidget(),
                      SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.map_rounded,
                        size: 50,
                        color: Colors.green,
                      ),
                    )),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Report',
                  style: GoogleFonts.poppins(),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 156, 212, 157),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Center(
                      child: Icon(Icons.recycling_rounded),
                    )),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Taman',
                  style: GoogleFonts.poppins(),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.new_releases,
                        size: 45,
                        color: Colors.red,
                      ),
                    )),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Berita',
                  style: GoogleFonts.poppins(),
                )
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
