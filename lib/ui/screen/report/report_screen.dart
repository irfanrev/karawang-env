import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/flutter_map.dart' as tandai;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karawang_env/controllers/logic_controller.dart';
import 'package:karawang_env/ui/screen/home/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:latlong2/latlong.dart' as latLng;

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  DateTime _dueDate = DateTime.now();
  String _dateText = '';
  final logicC = Get.put(LogicController());

  Future<Null> _selectDueDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2080),
    );
    if (picked != null) {
      setState(() {
        _dueDate = picked;
        _dateText = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _dateText = "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
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
                        point: latLng.LatLng(-6.310507, 107.293131),
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
                        point: latLng.LatLng(-6.3110544, 107.2926278),
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
            DraggableScrollableSheet(
              expand: true,
              initialChildSize: 0.6,
              minChildSize: 0.6,
              maxChildSize: 0.9,
              builder: ((context, scrollController) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
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
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color.fromARGB(255, 179, 179, 179)),
                          ),
                          child: Column(
                            children: [
                              Image.asset('assets/img/no-img.png'),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Masukan gambar/foto Masalah',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text('(Max 12 Mb)')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Mau report apa?',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 185, 185, 185)),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Masukan masalah'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Nama Pelapor',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 185, 185, 185)),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Masukan masalah'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Deskripsi',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 185, 185, 185)),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText:
                                  'Masukan deskripsi masalah yang terjadi'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Tanggal Report',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 13.0),
                          height: 70,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: GestureDetector(
                            onTap: () => _selectDueDate(context),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.date_range),
                                Padding(padding: EdgeInsets.only(left: 8.0)),
                                Expanded(
                                    child: Text('Date',
                                        style: GoogleFonts.poppins(
                                            fontSize: 16.0,
                                            color: Colors.black87))),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.grey[200]),
                                    onPressed: () => _selectDueDate(context),
                                    child: Text(_dateText,
                                        style: GoogleFonts.poppins(
                                            fontSize: 18.0,
                                            color: Colors.black87)))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Lokasi Masalah',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 185, 185, 185)),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText:
                                  'Masukan alamat atau patokan lokasi masalah'),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          onPressed: () => logicC.submitReport(),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                'Submit',
                                style: GoogleFonts.poppins(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
