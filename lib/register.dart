import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uniexpress/components/driver/header_view.dart'; // Importar HeaderView

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          'Registro de transportista',
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
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Guardar datos adicionales en Firestore
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(userCredential.user!.uid)
            .set({
          'email': _emailController.text,
          'password':_passwordController.text,
          // Nota: No se recomienda guardar contraseñas en texto plano en Firestore
          // 'password': _passwordController.text 
          // Puedes agregar más campos de usuario aquí según necesites
        });

        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registro exitoso!'),
          ),
        );

        // Navegar a la siguiente pantalla después del registro exitoso
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
      } catch (e) {
        // Manejar errores de registro o almacenamiento
        print('Error de registro o almacenamiento: $e');

        // Mostrar mensaje de error al usuario
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Registro fallido. Por favor, inténtalo de nuevo.'),
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
            const SizedBox(height: 300),
            const Text(
              'Registrar',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(65, 75, 178, 1),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico',
                hintText: 'correo@gmail.com',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingresa tu correo electrónico';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Contraseña',
              ),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor, ingresa tu contraseña';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(65, 75, 178, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Registrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
