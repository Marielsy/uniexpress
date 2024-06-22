import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController2 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
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
              child: const Text('Register'),
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
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController2.text,
          password: _passwordController2.text,
        );

        // Guardar datos adicionales en Firestore
        await FirebaseFirestore.instance
            .collection('usuarioAdmin')
            .doc(userCredential.user!.uid)
            .set({
          'email': _emailController2.text,
          'password': _passwordController2.text

          // Puedes agregar más campos de usuario aquí según necesites
        });

        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful!'),
          ),
        );

        // Aquí puedes navegar a la siguiente pantalla después del registro exitoso
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
      } catch (e) {
        // Manejar errores de registro o almacenamiento
        print('Error de registro o almacenamiento: $e');

        // Mostrar mensaje de error al usuario
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Registration failed. Please try again.'),
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
