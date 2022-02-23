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
                  color: Colors.teal[300],
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
                                CircleAvatar(),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hi,',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Irfan Maulana',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        color: Colors.white,
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
      ],
    ));
  }
}
