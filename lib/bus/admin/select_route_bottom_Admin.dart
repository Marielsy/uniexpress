import 'package:flutter/material.dart';
import 'package:uniexpress/bus/admin/select_bus_admin.dart';
import 'package:uniexpress/components/driver/custom_button.dart';
import 'package:uniexpress/utils/constants.dart';

class SelectRouteBottomSheet2 extends StatelessWidget {
  final List<String> routeList;
  final Function(String) onOptionSelected;

  const SelectRouteBottomSheet2({
    super.key,
    required this.routeList,
     required this.onOptionSelected,
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
            'Estado',
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
                    const Text('Transportista'),
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
                title: 'Volver', //Bloquear el back.
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectBusScreenAdmin(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(height: (bottomInset == 0) ? 19 : 0)
      ],
      
    );
    
  }
}
