import 'package:flutter/material.dart';
import 'package:uniexpress/bus/select_bus_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uniexpress/components/custom_button.dart';
import 'package:uniexpress/components/header_view.dart';
import 'package:uniexpress/components/textfield_view.dart';
import 'package:uniexpress/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<bool> _isLoginValid() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      try {
        // Verificar si el usuario existe en la colección "driver"
        final driverQuery = await FirebaseFirestore.instance
            .collection('driver')
            .where('/driver/Htj2HLNYJsHG9VqelBJx', isEqualTo: email)
            .limit(1)
            .get();

        if (driverQuery.docs.isNotEmpty) {
          final driverDoc = driverQuery.docs.first;
          print('Usuario encontrado: ${driverDoc.data()}'); // Depuración

          // Verificar si la contraseña coincide
          if (driverDoc.data()['contraseña'] == password) {
            return true;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Contraseña inválida, verifique'),
              ),
            );
            return false;
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Correo inválido, verifique'),
            ),
          );
          return false;
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
          ),
        );
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    const double headerHeight = 265;
    const double borderRadius = 32;

    return Scaffold(
      body: Stack(
        children: [
          HeaderView(
            height: headerHeight,
            child: _headerContent(),
          ),
          _ContentView(
            headerHeight: headerHeight,
            borderRadius: borderRadius,
            emailController: _emailController,
            passwordController: _passwordController,
            formKey: _formKey,
            isLoginValid: _isLoginValid,
          ),
        ],
      ),
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
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final Future<bool> Function() isLoginValid;

  const _ContentView({
    required this.headerHeight,
    required this.borderRadius,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.isLoginValid,
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
          offset: Offset(30, 16),
          color: Color.fromRGBO(14, 16, 40, 0.25),
          spreadRadius: 29,
          blurRadius: 20,
        )
      ],
    );

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: headerHeight - (borderRadius)),
        child: Column(
          children: [
            Container(
              height: borderRadius,
              decoration: boxDecoration,
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Constants.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFieldView(
                        title: 'Correo Electrónico',
                        placeholder: 'correo@gmail.com',
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu correo electrónico';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      TextFieldView(
                        title: 'Contraseña',
                        placeholder: 'Contraseña',
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu contraseña';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        title: 'Iniciar Sesión',
                        onPressed: () async {
                          if (await isLoginValid()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectBusScreen(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
