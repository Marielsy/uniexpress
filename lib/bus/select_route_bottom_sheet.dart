import 'package:flutter/material.dart';
import 'package:uniexpress/components/custom_button.dart';
import 'package:uniexpress/utils/constants.dart';

class SelectRouteBottomSheet extends StatelessWidget {
  final List<String> routeList;

  const SelectRouteBottomSheet({
    super.key,
    required this.routeList,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double bottomInset = MediaQuery.of(context).padding.bottom;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Lista de Rutas',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Constants.primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: routeList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      routeList[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text('Puntos claves de la ruta'),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Divider(
                        height: 20,
                        color: (index + 1 == routeList.length)
                            ? Colors.transparent
                            : Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SafeArea(
          child: Center(
            child: SizedBox(
              width: screenWidth * 0.7,
              child: CustomButton(
                title: 'Iniciar Ruta',
                onPressed: () {},
              ),
            ),
          ),
        ),
        SizedBox(height: (bottomInset == 0) ? 19 : 0)
      ],
    );
  }
}
