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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateLocation();
    });
  }

  List<double> currentLocation2 = [9.917650, -67.368466]; //villa o
  List<double> currentLocation3 = [9.916119, -67.370300]; //casaA
  List<double> currentLocation4 = [9.913859, -67.375480]; //evaristo
  List<double> currentLocation5 = [9.910774, -67.378669]; //bellavista
  List<double> currentLocation7 = [9.900672, -67.396340]; //agronomia
  List<double> currentLocation8 = [9.897285, -67.391315]; //ingenieria
  List<double> currentLocation9 = [9.893449, -67.386232]; //rectorado
  List<double> currentLocation10 = [9.901624, -67.374666]; //sector4 brisas
  List<double> currentLocation11 = [9.901933, -67.372808]; //sector2 brisas
  List<double> currentLocation12 = [9.905955, -67.369895]; //puerta negra
  List<double> currentLocation13 = [9.908804, -67.363805]; //licoreria
  List<double> currentLocation14 = [9.909278, -67.362533]; //panaderia Miranda
  List<double> currentLocation15 = [9.910046,-67.359247]; //casona universitaria
  List<double> currentLocation16 = [9.912329, -67.357306]; //banco de venezuela
  List<double> currentLocation17 = [9.912145, -67.357174]; //redoma

  List<double> currentLocation = [9.917075, -67.369107];
  String selectedValueTop = 'Agronomia';
  String selectedValueBottom = 'Av.Bolivar';

  List<List<double>> getCoordinates() {
    return [
      [9.917075, -67.369107],
      [9.916617, -67.369704],
      [9.915840, -67.370645],
      [9.915604, -67.371717],
      [9.914727, -67.374067],
      [9.910145, -67.379296],
      [9.912113, -67.377288],
      [9.907024, -67.381107],
      [9.903486, -67.386826],
      [9.901262, -67.391584],
      [9.901765, -67.395379],
      [9.900803, -67.396669],
      [9.899872, -67.397209],
      [9.897272, -67.391363],
      [9.893558, -67.386662],
      [9.893479, -67.386112],
    ];
  }

  void updateLocation() async {
    for (var coordinate in getCoordinates()) {
      await Future.delayed(const Duration(seconds: 10), () {
        setState(() {
          currentLocation = coordinate;
        });
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
          'T01 Terminal - Agronomía\nterminal, av bolivar, circo'
              '              10:56am',
          'V02 Villa Olimpica - Agronomía\nterminal, av bolivar, circo'
              '              10:56am',
        ];
      case 'Medicina':
        return [
          'T42 Terminal - Rectorado\nterminal, av bolivar, circo'
              '                10:56am',
          'C07 Casona - Rectorado\nterminal, av bolivar, circo'
              '              10:56am',
        ];
      case 'Ingenieria':
        return [
          'T42 Terminal - Ing Informática\nterminal, av bolivar, circo'
              '               10:56am',
          'A15 Agronomia - Ingenieria\nterminal, av bolivar, circo'
              '                     10:56am',
        ];
      case 'Cs Sociales':
        return [
          'T06 Terminal - Centro\nterminal, av bolivar, circo'
              '                 10:56am',
          'C21 Centro - Cs Sociales\nterminal, av bolivar, circo'
              '             10:56am',
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
            MarkerLayer(markers: [
              Marker(
                width: 200.0,
                height: 200.0,
                point: LatLng(currentLocation[0], currentLocation[1]),
                child: const Icon(Icons.bus_alert,
                    color: Colors.black, size: 50.0),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(currentLocation2[0], currentLocation2[1]),
                child: const Icon(
                  Icons.location_pin,
                  size: 40.0,
                  color: Color.fromRGBO(65, 75, 178, 1),
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
                  color: Color.fromRGBO(65, 75, 178, 1),
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
                  color: Color.fromRGBO(65, 75, 178, 1),
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
                  color: Color.fromRGBO(65, 75, 178, 1),
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
                  color: Color.fromRGBO(65, 75, 178, 1),
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
