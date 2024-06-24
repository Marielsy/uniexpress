import 'package:flutter/material.dart';
import 'package:uniexpress/components/driver/custom_button.dart';
import 'package:uniexpress/login/admin/login_2.dart';
import 'package:uniexpress/login/driver/login_screen.dart';
import 'package:uniexpress/user_screens/dashboard_user.dart';

class Constants {
  static const primaryColor = Color.fromRGBO(65, 75, 178, 1);
  static const buttonColor = Color.fromRGBO(255, 255, 255, 0.2);
  static const buttonTextColor = Colors.white;
}

class ScreenSelect extends StatelessWidget {
  const ScreenSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(
        0,
        4,
        80,
        1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/general/logo-icon.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 32),
            const Text(
              'Selecciona una opción:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomButton(
                    title: 'Soy Estudiante',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardUser(),
                          ));
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    title: 'Soy Transportista',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    title: 'Soy Supervisor',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginAdmin(),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
