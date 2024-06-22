import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uniexpress/bus/admin/select_bus_admin.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  _LoginAdminState createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController2 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController2,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingresa tu correo';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController2,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingresa tu contraseña';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                _submitForm();
              },
              child: const Text('Login2'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController2.text,
          password: _passwordController2.text,
        );

        // Si el inicio de sesión es exitoso, puedes navegar a la siguiente pantalla
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectBusScreenAdmin()));
        
        // Mostrar mensaje de éxito (opcional)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful!'),
          ),
        );
      } catch (e) {
        // Manejar errores de inicio de sesión
        print('Error de inicio de sesión: $e');

        // Mostrar mensaje de error al usuario (opcional)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Login failed. Please try again.'),
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
