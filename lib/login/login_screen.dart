import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uniexpress/bus/select_bus_screen.dart';
import 'package:uniexpress/components/custom_button.dart';
import 'package:uniexpress/components/header_view.dart';
import 'package:uniexpress/components/textfield_view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            HeaderView(
              height: 265,
              child: _headerContent(),
            ),
            _ContentView(
              emailController: _emailController,
              passwordController: _passwordController,
              formKey: _formKey,
              onPressed: _submitForm,
            ),
          ],
        ),
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

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Verificar si el usuario existe en Firestore
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('usuarios')
            .where('email', isEqualTo: _emailController.text)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          // Usuario encontrado en la colección 'usuarios'
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );

          // Mostrar mensaje de éxito
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login successful!'),
            ),
          );
          await Future.delayed(const Duration(seconds: 1));

          // Navegar a la siguiente pantalla
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SelectBusScreen(),
            ),
          );
        } else {
          // Mostrar mensaje de usuario no registrado en Firestore
          _showErrorDialog('Usuario no registrado');
        }
      } catch (e) {
        // Manejar errores de inicio de sesión
        print('Error de inicio de sesión: $e');
        _showErrorDialog(
            'Error al iniciar sesión, valida tu correo y contraseña');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class _ContentView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onPressed;

  const _ContentView({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 300), // Ajustar el espacio según necesites
            const Text(
              'Iniciar Sesión',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(65, 75, 178, 1),
              ),
            ),
            const SizedBox(height: 30),
            TextFieldView(
              title: 'Correo Electrónico',
              placeholder: 'correo@gmail.com',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingresa tu correo electrónico';
                }
                return null;
              },
              controller: emailController,
            ),
            const SizedBox(height: 24),
            TextFieldView(
              title: 'Contraseña',
              placeholder: 'Contraseña',
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingresa tu contraseña';
                }
                return null;
              },
              controller: passwordController,
            ),
            const SizedBox(height: 30),
            CustomButton(
              title: 'Iniciar Sesión',
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
