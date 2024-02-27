import 'package:flutter/material.dart';
import 'package:uniexpress/bus/select_route_bottom_sheet.dart';
import 'package:uniexpress/components/header_view.dart';
import 'package:uniexpress/utils/constants.dart';

class SelectBusScreen extends StatefulWidget {
  const SelectBusScreen({super.key});

  @override
  State<SelectBusScreen> createState() => _SelectBusScreenState();
}

class _SelectBusScreenState extends State<SelectBusScreen> {
  int? isSelected;

  @override
  Widget build(BuildContext context) {
    //Calculate Inset top SafeAreat
    final topSafeArea = MediaQuery.of(context).padding;
    double headerHeight = 109 + topSafeArea.top;
    const double borderRadius = 32;
    return Stack(
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
            itemCount: 20,
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
    );
  }

  void showRouteModal() {
    showModalBottomSheet(
      // backgroundColor: Colors.transparent,
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32.0),
        ),
      ),
      builder: (BuildContext context) {
        return const SizedBox(
          height: 400,
          child: SelectRouteBottomSheet(
            routeList: [
              //TODO: read from the API
              'T01 Terminal - Agronomía',
              'P02 Parque - Agronomía',
              'T42 Terminal - Ing Informática',
              'T06 Terminal - Comedor',
            ],
          ),
        );
      },
    );
  }

  Widget _headerContent(double headerHeight) {
    return SizedBox(
      height: headerHeight,
      child: const Column(
        children: [
          Spacer(),
          Text(
            'Selecciona tu Ruta',
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

    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Constants.primaryColor
            : const Color.fromRGBO(236, 236, 236, 1),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
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
            'Ruta Centro',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Text(
            'Bus A0${(index + 1)}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
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
      padding: EdgeInsets.only(top: headerHeight - (borderRadius * 2)),
      child: Container(
        width: double.infinity,
        decoration: boxDecoration,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                'Lista de Transportes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Constants.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
