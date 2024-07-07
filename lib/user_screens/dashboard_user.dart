import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart' as loc;

class Constants {
  static const primaryColor = Color.fromRGBO(65, 75, 178, 1);
}

// ignore: constant_identifier_names
const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoiY2FydmFqYWxtYXJpZWxzeSIsImEiOiJjbHZyOWdkZGEwa2JlMmttZzNuZ2V3Nm52In0.XzknMqNCOBNtUgnHKvCHhg';
const myPosition = LatLng(9.9115200, -67.3538100);

class DashboardUser extends StatefulWidget {
  // ignore: use_super_parameters
  const DashboardUser({
    Key? key,
    this.placeholder = 'Ejkjk',
  }) : super(key: key);

  final String placeholder;

  @override
  // ignore: library_private_types_in_public_api
  _DashboardUserState createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
    final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateLocation();
    });
  }

  List<double> currentUser = [9.917735,-67.368834]; //person
  List<double> currentLocation2 = [9.917075, -67.369107]; //villa o
  List<double> currentLocation3 = [9.916617, -67.369704]; //casaA
  List<double> currentLocation4 = [9.91584, -67.370645]; //evaristo
  List<double> currentLocation5 = [9.915256, -67.372681]; //bellavista
  List<double> currentLocation7 = [9.914571, -67.374399]; //agronomia
  List<double> currentLocation8 = [9.910851, -67.378603]; //ingenieria
  List<double> currentLocation9 = [9.906829, -67.381220]; //rectorado
  List<double> currentLocation10 = [9.904663, -67.384396]; //sector4 brisas
  List<double> currentLocation11 = [9.903085, -67.387676]; //sector2 brisas
  List<double> currentLocation12 = [9.901269, -67.391518]; //puerta negra
  List<double> currentLocation13 = [9.900817, -67.396952]; //licoreria
  List<double> currentLocation14 = [9.900311, -67.397383]; //panaderia Miranda
  List<double> currentLocation15 = [9.899950, -67.396748]; //casona universitaria
  List<double> currentLocation16 = [9.897291, -67.391353]; //banco de venezuela
  List<double> currentLocation17 = [9.893479, -67.386363]; //redoma
  List<double> currentLocation18 = [9.90058, -67.377366]; //redoma
  List<double> currentLocation19 = [9.901914, -67.375369]; 
  List<double> currentLocation20 = [9.902517, -67.373323]; 
  List<double> currentLocation21 = [9.904325, -67.370644]; 
  List<double> currentLocation22 = [9.905035, -67.369275]; 
  List<double> currentLocation23 = [9.904025, -67.367116]; 
  List<double> currentLocation24 = [9.904701, -67.364808]; 
  List<double> currentLocation25 = [9.905266, -67.364139];
  List<double> currentLocation26 = [9.909193, -67.362551]; 
  List<double> currentLocation27 = [9.908670, -67.361130]; //redoma
  List<double> currentLocation28 = [9.907989, -67.361500]; //redoma
  List<double> currentLocation29 = [9.907368, -67.360158]; //redoma
  List<double> currentLocation30 = [9.908454, -67.358935]; //redoma
  List<double> currentLocation31 = [9.909626, -67.357939]; //redoma
  List<double> currentLocation32 = [9.910821, -67.356954]; //redoma
  List<double> currentLocation33 = [9.910821, -67.356954]; //redoma
  List<double> currentLocation34 = [9.912050, -67.355611]; //redoma
  List<double> currentLocation35 = [9.912815, -67.356194]; //redoma
  List<double> currentLocation36 = [9.914261, -67.358010]; //redoma
  List<double> currentLocation37 = [9.915310, -67.361288]; //redoma
  List<double> currentLocation38 = [9.916149, -67.362734]; //redoma
  List<double> currentLocation39 = [9.917078, -67.365971]; //redoma
  List<double> currentLocation40 = [9.917732, -67.368369]; //redoma

  List<double> currentLocation = [9.917473, -67.368669];
  String selectedValueTop = 'Agronomia';
  String selectedValueBottom = 'Av.Bolivar';

  List<List<double>> getCoordinates() {
    return [
      [9.917075, -67.369107],
      [9.916617, -67.369704],
      [9.91584, -67.370645],
      [9.915256, -67.372681],
      [9.914571, -67.374399],
      [9.910851, -67.378603],
      [9.906829, -67.381220],
      [9.904663, -67.384396],
      [9.903085, -67.387676],
      [9.901269, -67.391518],
      [9.900817, -67.396952],
      [9.900311, -67.397383],
      [9.899950, -67.396748],
      [9.897291, -67.391353],
      [9.893479, -67.386363],
      [9.90058, -67.377366],
      [9.901914, -67.375369],
      [9.902517, -67.373323],
      [9.904325, -67.370644],
      [9.905035, -67.369275],
      [9.904025, -67.367116],
      [9.904701, -67.364808],
      [9.905266, -67.364139],
      [9.909193, -67.362551],
      [9.908670, -67.361130],
      [9.907989, -67.361500],
      [9.907368, -67.360158],
      [9.908454, -67.358935],
      [9.909626, -67.357939],
      [9.910821, -67.356954],
      [9.912050, -67.355611],
      [9.912815, -67.356194],
      [9.914261, -67.358010],
      [9.915310, -67.361288],
      [9.916149, -67.362734],
      [9.917078, -67.365971],
      [9.917732, -67.368369],
    ];
  }

  void updateLocation() async {
    for (var coordinate in getCoordinates()) {
      await Future.delayed(const Duration(seconds: 4), () {
        setState(() {
          currentLocation = coordinate;
        });
        _mapController.move(LatLng(currentLocation[0], currentLocation[1]), 15.0);
        // ignore: avoid_print
        // print("hjhjhj");
      });
    }
  }

  void _showRouteModal() {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6.0),
              topRight: Radius.circular(16.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8.0,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lista de Buses',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              const Divider(height: 0),
              Expanded(
                child: SelectRouteBottomSheet(
                  routeList: _getRouteList(selectedValueTop),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<String> _getRouteList(String selectedValue) {
    switch (selectedValue) {
      case 'Agronomia':
        return [
          'T01 Terminal - Agronomía\nterminal, av Bolivar,Casona '
              '              8:00am',
          'V02 Villa Olimpica - Agronomía\nCentro,'
              '              10:56am',
        ];
      case 'Medicina':
        return [
          'T42 Terminal - Rectorado\nterminal, av bolivar, '
              '                9:30am',
          'C07 Casona - Rectorado\nterminal, av bolivar,'
              '              11:56am',
        ];
      case 'Ingenieria':
        return [
          'T42 Terminal - Ing Informática\nterminal, av bolivar,'
              '               8:56am',
          'A15 Agronomia - Ingenieria\nterminal, av bolivar,'
              '                     10:56am',
        ];
      case 'Cs Sociales':
        return [
          'B06 Banco Obrero, Agronomia, No disponible'
              '                 11:00am' ,
          'C21 Centro - Cs Sociales\nterminal, av bolivar,'
              '             12:00am',
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      FlutterMap(
        mapController: _mapController,
          options: MapOptions(
            initialCenter: LatLng(currentLocation[0], currentLocation[1]),
            minZoom: 5,
            maxZoom: 25,
            initialZoom: 18,
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
              additionalOptions: const {
                'accessToken': MAPBOX_ACCESS_TOKEN,
                'id': 'mapbox/streets-v11',
              },
            ),
            PolylineLayer(
              polylines: [
                Polyline(
                  points: getCoordinates()
                      .map((coord) => LatLng(coord[0], coord[1]))
                      .toList(),
                  strokeWidth: 6.0,
                  color: Colors.grey,
                ),
              ],
            ),
            MarkerLayer(markers: [
              Marker(
                width: 200.0,
                height: 200.0,
                point: LatLng(currentLocation[0], currentLocation[1]),
                child: const Icon(Icons.car_crash,
                    color: Colors.black, size: 50.0),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation2[0], currentLocation2[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation3[0], currentLocation3[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentUser[0], currentUser[1]),
                child: const Icon(
                  Icons.person,
                  size: 60.0,
                  color:Colors.black,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation4[0], currentLocation4[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation5[0], currentLocation5[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation7[0], currentLocation7[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation8[0], currentLocation8[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation9[0], currentLocation9[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation10[0], currentLocation10[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation11[0], currentLocation11[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation12[0], currentLocation12[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation13[0], currentLocation13[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation14[0], currentLocation14[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation15[0], currentLocation15[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation16[0], currentLocation16[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation17[0], currentLocation17[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation18[0], currentLocation18[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation19[0], currentLocation19[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation20[0], currentLocation20[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation21[0], currentLocation21[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation22[0], currentLocation22[1]),
                child: const Icon(
                  Icons.person,
                  size: 40.0,
                  color: Colors.black,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation23[0], currentLocation23[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation24[0], currentLocation24[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation25[0], currentLocation25[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation26[0], currentLocation26[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation27[0], currentLocation27[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation28[0], currentLocation28[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation29[0], currentLocation29[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation30[0], currentLocation30[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation31[0], currentLocation31[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation32[0], currentLocation32[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation33[0], currentLocation33[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation34[0], currentLocation34[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation35[0], currentLocation35[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation36[0], currentLocation36[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation37[0], currentLocation37[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation38[0], currentLocation38[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation39[0], currentLocation39[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation40[0], currentLocation40[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
                ),
              ),
            ]

                // getCoordinates().map(

                //   (coord) =>  Marker(
                //     width: 200.0,
                //     height: 200.0,
                //     point: LatLng(coord.first, coord.last),
                //     child: const Icon(Icons.bus_alert_rounded,
                //         color: Colors.black, size: 50.0),
                //   ),
                // ).toList(),
                ),
            Positioned(
                top: 100,
                left: 20,
                right: 20,
                height: 150,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 8),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 52, left: 8),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 64, left: 8),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 3),
                            SizedBox(
                              width: 15,
                              height: 15,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blue),
                                ),
                                child: const Icon(
                                  Icons.circle_rounded,
                                  size: 10,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(child: _dropdownCurrentLocation()),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            const SizedBox(
                              width: 15,
                              height: 15,
                              child: Icon(
                                Icons.location_on,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: _dropdownDestination()),
                          ],
                        ),
                      ],
                    ),
                  ],
                ))
          ])
    ]));
  }

  DropdownButtonFormField<String> _dropdownCurrentLocation() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Elegir Parada...',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
      ),
      dropdownColor: Colors.white,
      value: selectedValueBottom,
      onChanged: (newValue) {
        if (newValue != null) {
          setState(() {
            selectedValueBottom = newValue;
          });
        }
      },
      isExpanded: true,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      items: const [
        DropdownMenuItem<String>(
          value: 'Av.Bolivar',
          child: Text('Av.Bolivar'),
        ),
        DropdownMenuItem<String>(
          value: 'Av.Miranda',
          child: Text('Av.Miranda'),
        ),
        DropdownMenuItem<String>(
          value: 'Villa Olimpica',
          child: Text('Villa Olimpica'),
        ),
      ],
    );
  }

  DropdownButtonFormField<String> _dropdownDestination() {
    List<Map<String, List<double>>> destinationValues = [
      {
        'Agronomia': [-67.396340, 9.900672],
      },
      {
        'Medicina': [-67.386405, 9.893469]
      },
      {
        'Ingenieria': [-67.391362, 9.897284]
      },
      {
        'Cs Sociales': [-67.385058, 9.894283]
      },
    ];

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Elegir Parada...',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
      ),
      dropdownColor: Colors.white,
      //  hint: Text('Elegir Parada...'),
      value: selectedValueTop,
      onChanged: (newValue) {
        if (newValue != null) {
          setState(() {
            selectedValueTop = newValue;
          });
          _showRouteModal();
        }
      },
      isExpanded: true,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),

      items: destinationValues.map<DropdownMenuItem<String>>((map) {
        String key = map.keys.first;
        // ignore: unused_local_variable
        List<double> value = map.values.first;

        return DropdownMenuItem<String>(
          value: key,
          child: Text(key),
        );
      }).toList(),
    );
  }
}

class SelectRouteBottomSheet extends StatelessWidget {
  final List<String> routeList;

  const SelectRouteBottomSheet({
    super.key,
    required this.routeList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: routeList.length,
      separatorBuilder: (context, index) => const Divider(height: 0),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: Text(routeList[index]),
          onTap: () {
            // ignore: avoid_print
            print('Selected route: ${routeList[index]}');
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
