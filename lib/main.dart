import 'package:flutter/material.dart';
import 'package:uniexpress/bus/select_bus_screen.dart';
import 'package:uniexpress/splahs/select_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ScreenSelect(),
      ),
    );
  }
}
