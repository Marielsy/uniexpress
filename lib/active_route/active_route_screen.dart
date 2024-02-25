import 'package:flutter/material.dart';
import 'package:uniexpress/components/custom_button.dart';
import 'package:uniexpress/components/header_view.dart';
import 'package:uniexpress/utils/constants.dart';

class ActiveRouteScreen extends StatelessWidget {
  const ActiveRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Calculate Inset top SafeAreat
    final topSafeArea = MediaQuery.of(context).padding;
    double headerHeight = 120 + topSafeArea.top;
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
          titleRoute: 'Ruta Centro',
        )
      ],
    );
  }

  Widget _headerContent(double headerHeight) {
    return SizedBox(
      height: headerHeight,
      child: const Column(
        children: [
          Spacer(),
          Text(
            'Ruta Activa',
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

class _ContentViewSelectRoute extends StatelessWidget {
  final double headerHeight;
  final double borderRadius;
  final String titleRoute;

  const _ContentViewSelectRoute({
    required this.headerHeight,
    required this.borderRadius,
    required this.titleRoute,
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
          offset: Offset(30, 16),
          color: Color.fromRGBO(14, 16, 40, 0.25),
          spreadRadius: 29,
          blurRadius: 20,
        )
      ],
    );

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: headerHeight - (borderRadius)),
        child: Column(
          children: [
            Container(
              height: borderRadius,
              decoration: boxDecoration,
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleRoute,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Constants.primaryColor,
                      ),
                    ),
                    const Center(
                      child: Image(
                        image: AssetImage('assets/general/bus-icon.png'),
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                    const _DetailsView()
                  ],
                ),
              ),
            ),
            const SizedBox(height: 56),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomButton(
                title: 'Finalizar Ruta',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DetailsView extends StatelessWidget {
  const _DetailsView();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            _CardView(
              title: 'Identificar',
              subtitle: 'Bus 003',
            ),
            SizedBox(width: 20),
            _CardView(
              title: 'Caraterística',
              subtitle: 'Yutong Rojo',
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            _CardView(
              title: 'Placa',
              subtitle: '67C-OL3',
            ),
            SizedBox(width: 20),
            _CardView(
              title: 'Asientos',
              subtitle: '32 Asientos',
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            _CardView(
              title: 'Hora de Inicio',
              subtitle: '03 : 00 PM',
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class _CardView extends StatelessWidget {
  final String title;
  final String subtitle;
  const _CardView({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 62,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(236, 236, 236, 1),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 4,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.2,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
