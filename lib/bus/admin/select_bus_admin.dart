import 'package:flutter/material.dart';
import 'package:uniexpress/components/driver/header_view.dart';
import 'package:uniexpress/splahs/select_screen.dart';

class SelectBusScreenAdmin extends StatefulWidget {
  const SelectBusScreenAdmin({super.key});

  @override
  State<SelectBusScreenAdmin> createState() => _SelectBusScreenAdminState();
}

class _SelectBusScreenAdminState extends State<SelectBusScreenAdmin> {
  int? isSelected;
  String? _selectedOption; // Definir la variable de estado

  @override
  Widget build(BuildContext context) {
    // Calculate Inset top SafeArea
    final topSafeArea = MediaQuery.of(context).padding;
    double headerHeight = 108 + topSafeArea.top;
    const double borderRadius = 30;
    return Scaffold(
      body: Stack(
        children: [
          HeaderView(
            height: headerHeight,
            child: Column(
              children: [
                _headerContent(headerHeight),
              ],
            ),
          ),
          _ContentViewSelectRoute(
            borderRadius: borderRadius,
            headerHeight: headerHeight,
          ),
          Padding(
            padding: EdgeInsets.only(top: headerHeight),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = index;
                    });
                    showRouteModal();
                  },
                  child: _TransportListCell(
                    isSelected: (isSelected == index),
                    index: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showRouteModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.0)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Estado',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(65, 75, 178, 1),
                  ),
                ),
                ListTile(
                  leading: Checkbox(
                    value: _selectedOption == 'Activo',
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedOption = 'Activo';
                      });
                      print('Opción seleccionada: Activo');
                    },
                  ),
                  title: Text('Activo'),
                  onTap: () {
                    setState(() {
                      _selectedOption = 'Activo';
                    });
                    print('Opción seleccionada: Activo');
                  },
                ),
                ListTile(
                  leading: Checkbox(
                    value: _selectedOption == 'Inactivo',
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedOption = 'Inactivo';
                      });
                      print('Opción seleccionada: Inactivo');
                    },
                  ),
                  title: const Text('Inactivo'),
                  onTap: () {
                    setState(() {
                      _selectedOption = 'Inactivo';
                    });
                    print('Opción seleccionada: Inactivo');
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Volver'),
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      _showModalbuttons(context);
    });
  }

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
                'Selecciona una opción',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenSelect(),
                        ),
                      );
                    },
                    child: const Text('Salir'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('registerPage');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(65, 75, 178, 1),
                    ),
                    child: const Text(
                      'Registrar transportista',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _headerContent(double headerHeight) {
    return SizedBox(
      height: headerHeight,
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: const Column(
          children: [
            Spacer(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Supervisor',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Spacer()
          ],
        ),
      ),
    );
  }
}

class _TransportListCell extends StatelessWidget {
  final bool isSelected;
  final int index;

  const _TransportListCell({
    required this.isSelected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = (isSelected) ? Colors.white : Colors.black;

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromRGBO(65, 75, 178, 1)
                : const Color.fromRGBO(236, 236, 236, 1),
            borderRadius:
                const BorderRadius.all(Radius.circular(16)), // tarjetas
            boxShadow: [
              BoxShadow(
                offset: Offset(0, (isSelected) ? 4 : 1),
                blurRadius: (isSelected) ? 8 : 4,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          ),
          child: Column(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Image(
                    image: AssetImage('assets/general/bus-icon.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Text(
                'Nombre Apellido',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                'transportista ${(index + 1)}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContentViewSelectRoute extends StatelessWidget {
  final double headerHeight;
  final double borderRadius;

  const _ContentViewSelectRoute({
    required this.headerHeight,
    required this.borderRadius,
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
          offset: Offset(40, 0),
          color: Color.fromRGBO(14, 16, 40, 0.25),
          spreadRadius: 29,
          blurRadius: 32,
        )
      ],
    );

    return Padding(
      padding: EdgeInsets.only(top: headerHeight - (borderRadius * 1)),
      child: Container(
        width: double.infinity,
        decoration: boxDecoration,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              // Text(
              //   'Transportistas',
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Constants.primaryColor,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
