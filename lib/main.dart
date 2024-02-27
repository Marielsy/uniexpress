import 'package:flutter/material.dart';
import 'package:uniexpress/active_route/active_route_screen.dart';
import 'package:uniexpress/bus/select_bus_screen.dart';
import 'package:uniexpress/login/login_screen.dart';

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
        body: ActiveRouteScreen(),
      ),
    );
  }
}
