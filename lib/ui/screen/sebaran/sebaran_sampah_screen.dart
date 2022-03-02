import 'package:flutter/material.dart';

class SebaranSampah extends StatefulWidget {
  const SebaranSampah({Key? key}) : super(key: key);

  @override
  _SebaranSampahState createState() => _SebaranSampahState();
}

class _SebaranSampahState extends State<SebaranSampah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [Text('data')],
      )),
    );
  }
}
