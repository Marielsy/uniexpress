import 'package:flutter/material.dart';

class DashboardUser extends StatelessWidget {
  const DashboardUser({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'opcion1'; 
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: SizedBox.expand(
              child: ColoredBox(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 100, 
            left: 150,
            right: 150,
            child: DropdownButton<String>(
              value: selectedValue,
              onChanged: (newValue) {
                print('Seleccionó: $newValue');
                selectedValue = newValue!;
              },
              items: const [
                DropdownMenuItem<String>(
                  value: 'opcion1',
                  child: Text('Agronomia'),
                ),
                DropdownMenuItem<String>(
                  value: 'opcion2',
                  child: Text('Medicina'),
                ),
                DropdownMenuItem<String>(
                  value: 'opcion3',
                  child: Text('Ingenieria'),
                ),
                DropdownMenuItem<String>(
                  value: 'opcion4',
                  child: Text('Cs Sociales'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}