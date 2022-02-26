import 'package:flutter/material.dart';

class TamanScreen extends StatefulWidget {
  const TamanScreen({Key? key}) : super(key: key);

  @override
  _TamanScreenState createState() => _TamanScreenState();
}

class _TamanScreenState extends State<TamanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Taman Screen'),
      ),
    );
  }
}
