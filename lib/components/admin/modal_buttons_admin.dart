import 'package:flutter/material.dart';
import 'package:uniexpress/login/admin/login_2.dart';
import 'package:uniexpress/register.dart';

class ModalButtons extends StatelessWidget {
  const ModalButtons({super.key});

  void _showModalbuttons(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Modal Title',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Modal Content',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginAdmin()));
                    },
                    child: const Text('Salir'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes añadir la lógica para registrar
                      // Por ejemplo, navegar a una pantalla de registro
                      Navigator.of(context).pop(); // Cerrar el modal actual
                      // Navegar a la pantalla de registro
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                    },
                    child: const Text('Registrar'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modal Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showModalbuttons(context);
          },
          child: const Text('Mostrar Modal'),
        ),
      ),
    );
  }
}
