import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uniexpress/login/admin/login_2.dart';
import 'package:uniexpress/register.dart';
import 'package:uniexpress/splahs/select_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'ScreenSelect',
      routes: {
        'ScreenSelect':(_) =>  const ScreenSelect(),
        'loginAdmin':(_)=>  const LoginAdmin(),
        'registerPage':(_)=>  const RegisterPage(),

      },
    );
  }
}
