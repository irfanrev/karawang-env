import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart' as tandai;
import 'package:latlong2/latlong.dart' as latLng;

class TamanDetail extends StatefulWidget {
  const TamanDetail({Key? key}) : super(key: key);

  @override
  State<TamanDetail> createState() => _TamanDetailState();
}

class _TamanDetailState extends State<TamanDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: [
              Container(
                width: Get.width,
                height: 350,
                color: Colors.green,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                width: Get.width,
                height: 55,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(Icons.arrow_back)),
                    )
                  ],
                ),
              ),
              DraggableScrollableSheet(
                expand: true,
                initialChildSize: 0.7,
                minChildSize: 0.6,
                maxChildSize: 0.9,
                builder: ((context, scrollController) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 150),
                            height: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.green,
                                ),
                                child: Text(
                                  'Teluk Jambe, Karawang',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              'Alun-alun Karawang',
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Karawang, Jawa Barat',
                              style: GoogleFonts.poppins(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: Get.width,
                            child: Text(
                              'Alun Alun Karawang merupakan tempat wisata di provinsi Jawa Barat. Objek wisata Alun Alun Karawang terletak 6 km barat laut kota Karawang.',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              'Peta Lokasi',
                              style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Get.width,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: FlutterMap(
                              options: MapOptions(
                                center: latLng.LatLng(-6.310507, 107.293131),
                                zoom: 18.0,
                              ),
                              layers: [
                                TileLayerOptions(
                                  urlTemplate:
                                      "https://api.mapbox.com/styles/v1/irfanrev/ckyy14nmg002i15p7dmad3zfk/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaXJmYW5yZXYiLCJhIjoiY2t5eHYzYnBoMG0wNjJ2bzJsdmVmYTJuciJ9.4B_V8Hbrff-1_045m2ULRA",
                                  additionalOptions: {
                                    'accessToken':
                                        'pk.eyJ1IjoiaXJmYW5yZXYiLCJhIjoiY2t5eHYzYnBoMG0wNjJ2bzJsdmVmYTJuciJ9.4B_V8Hbrff-1_045m2ULRA',
                                    'id': 'mapbox.mapbox-streets-v8'
                                  },
                                  attributionBuilder: (_) {
                                    return Text("© OpenStreetMap contributors");
                                  },
                                ),
                                MarkerLayerOptions(
                                  markers: [
                                    tandai.Marker(
                                      width: 80.0,
                                      height: 80.0,
                                      point:
                                          latLng.LatLng(-6.310507, 107.293131),
                                      builder: (ctx) => Container(
                                          child: Icon(
                                        Icons.location_on,
                                        color: Colors.green,
                                        size: 40,
                                      )),
                                    ),
                                    tandai.Marker(
                                      width: 80.0,
                                      height: 80.0,
                                      point: latLng.LatLng(
                                          -6.3110544, 107.2926278),
                                      builder: (ctx) => Container(
                                          child: Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                        size: 40,
                                      )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Get.width,
                            height: 55,
                            child: Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: Get.width,
                                    height: Get.height,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                        child: Text(
                                      'Rute',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    )),
                                  ),
                                )),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: Get.width,
                                      height: Get.height,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.amber,
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Kunjugi nanti',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            child: Text(
                              'Fasilitas',
                              style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Text(
                              'Masjid, WC, Soufenir',
                              style: GoogleFonts.poppins(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
