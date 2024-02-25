import 'package:flutter/material.dart';
import 'package:uniexpress/components/custom_button.dart';
import 'package:uniexpress/components/header_view.dart';
import 'package:uniexpress/components/textfield_view.dart';
import 'package:uniexpress/utils/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double headerHeight = 265;
    const double borderRadius = 32;
    return Stack(
      children: [
        HeaderView(
          height: headerHeight,
          child: _headerContent(),
        ),
        const _ContentView(
          headerHeight: headerHeight,
          borderRadius: borderRadius,
        ),
      ],
    );
  }

  Widget _headerContent() {
    return const Column(
      children: [
        Spacer(),
        Text(
          'UniExpress',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Transportista',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 185, 0, 1),
          ),
        ),
        Spacer(),
      ],
    );
  }
}

class _ContentView extends StatelessWidget {
  final double headerHeight;
  final double borderRadius;

  const _ContentView({
    required this.headerHeight,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius),
      ),
      boxShadow: const [
        BoxShadow(
          offset: Offset(0, -16),
          color: Color.fromRGBO(14, 16, 40, 0.25),
          // color: Colors.red,
          spreadRadius: -10,
          blurRadius: 20,
        )
      ],
    );

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top: headerHeight - (borderRadius * 2)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 420,
              decoration: boxDecoration,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Constants.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const TextFieldView(
                      title: 'Correo Electrónico',
                      placeholder: 'correo@gmail.com',
                    ),
                    const SizedBox(height: 24),
                    const TextFieldView(
                      title: 'Contraseña',
                      placeholder: 'Contraseña',
                      obscureText: true,
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      title: 'Iniciar Sesión',
                      onPressed: () {
                        debugPrint('login pressed');
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomButton(
                      title: 'Restablecer contraseña',
                      isTransparent: true,
                      onPressed: () {
                        debugPrint('contraseña presionado');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
