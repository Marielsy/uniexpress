import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uniexpress/bus/select_bus_screen.dart';
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
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(userCredential.user!.uid)
            .set({
          'email': _emailController.text,
        });

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful!'),
          ),
        );
        await Future.delayed(const Duration(seconds: 1));

        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const SelectBusScreen(),
          ),
        );

        // Aquí puedes navegar a la siguiente pantalla después del login exitoso
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
      } catch (e) {
        // Manejar errores de inicio de sesión o almacenamiento
        print('Error de inicio de sesión o almacenamiento: $e');

        // Mostrar mensaje de error al usuario
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                  'Error al iniciar sesion, valida tu correo y contraseña'),
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
              'Iniciar Sesion',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(65, 75, 178, 1),
              ),
            ),
            const SizedBox(height: 30),
            TextFieldView(
              title: 'Contraseña',
              placeholder: 'Contraseña',
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              controller: null,
            ),
            const SizedBox(height: 24),
            TextFieldView(
              title: 'Contraseña',
              placeholder: 'Contraseña',
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              controller: null,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Color.fromRGBO(65, 75, 178, 1), // Color del texto del botón
                padding:
                    EdgeInsets.symmetric(vertical: 1 - 10), // Padding del botón
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Radio de borde del botón
                ),
              ),
              onPressed: onPressed,
              child: const Text(
                'Entrar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
