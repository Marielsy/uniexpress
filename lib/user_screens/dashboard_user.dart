import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Constants {
  static const primaryColor = Color.fromRGBO(65, 75, 178, 1);
}

// ignore: constant_identifier_names
const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoiY2FydmFqYWxtYXJpZWxzeSIsImEiOiJjbHZyOWdkZGEwa2JlMmttZzNuZ2V3Nm52In0.XzknMqNCOBNtUgnHKvCHhg';
const myPosition = LatLng(9.9115200, -67.3538100);

class DashboardUser extends StatefulWidget {
  const DashboardUser({super.key});
  

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
  List<double> currentLocation = [9.917715, -67.368376];
  String selectedValueTop = 'Agronomia';
  String selectedValueBottom = 'Av.Bolivar';

  List<List<double>> getCoordinates() {
    return [
      [9.917715, -67.368376],
      [9.917373, -67.368792],
      [9.917001, -67.369236],
      [9.916527, -67.369788],
      [9.915836, -67.370636],
      [9.915426, -67.372254],
      [9.914967, -67.373376],
      [9.913634, -67.375719],
      [9.911506, -67.377935],
      [9.909865, -67.379617],
      [9.906994, -67.381097],
      [9.903473, -67.386904],
      [9.901327, -67.391383],
      [9.901980, -67.394104],
      [9.901865, -67.394800],
      [9.901737, -67.395382],
      [9.900552, -67.395472],
      [9.900313, -67.395900],
      [9.900713, -67.396415],
      [9.900811, -67.397035],
      [9.900498, -67.397374],
      [9.899979, -67.397324],
      [9.898135, -67.391306],
      [9.893394, -67.385819]
    ];
  }

  void updateLocation()async {
    for (var coordinate in getCoordinates()) {
      await Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          currentLocation = coordinate;
        });
        // ignore: avoid_print
        print("hjhjhj");
      });
    }
  }

  final marke = [
    const Marker(
      width: 200.0,
      height: 200.0,
      point: LatLng(9.9105200, -67.3538100),
      child: Icon(Icons.location_on, color: Colors.blue, size: 50.0),
    ),
    const Marker(
      width: 200.0,
      height: 200.0,
      point: LatLng(9.9135200, -67.3548100),
      child: Icon(Icons.location_on, color: Colors.orange, size: 50.0),
    ),
    const Marker(
      width: 200.0,
      height: 500.0,
      point: LatLng(9.9155200, -67.3548100),
      child: Icon(Icons.location_on, color: Colors.red, size: 50.0),
    ),
    const Marker(
      width: 200.0,
      height: 200.0,
      point: LatLng(9.9175200, -67.3548100),
      child: Icon(Icons.location_on, color: Colors.pink, size: 50.0),
    ),
    const Marker(
      width: 200.0,
      height: 200.0,
      point: LatLng(9.9185200, -67.3548100),
      child: Icon(Icons.person_off_outlined, color: Colors.black, size: 50.0),
    ),
    const Marker(
      width: 200.0,
      height: 200.0,
      point: LatLng(9.9165200, -67.3548100),
      child: Icon(Icons.bus_alert_sharp, color: Colors.black, size: 50.0),
    ),
  ];

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
        return SizedBox(
          height: 200,
          child: SelectRouteBottomSheet(
            routeList: _getRouteList(selectedValueTop),
          ),
        );
      },
    );
  }

  List<String> _getRouteList(String selectedValue) {
    switch (selectedValue) {
      case 'Agronomia':
        return [
          'T01 Terminal - Agronomía',
          'V02 Villa Olimpica - Agronomía',
        ];
      case 'Medicina':
        return [
          'T42 Terminal - Medicina',
          'C07 Casona - Medicina',
        ];
      case 'Ingenieria':
        return [
          'T42 Terminal - Ing Informática',
          'A15 Agronomia - Ingenieria',
        ];
      case 'Cs Sociales':
        return [
          'T06 Terminal - Centro',
          'C21 Centro - Cs Sociales',
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options:  MapOptions(
              initialCenter:LatLng(currentLocation[0],currentLocation[1]),
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
                  child:
                      const Icon(Icons.location_on, color: Colors.pink, size: 50.0),
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
            ],
          ),
          Positioned(
            top: 100,
            left: 150,
            right: 150,
            child: Column(
              children: [
                DropdownButton<String>(
                  value: selectedValueTop,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedValueTop = newValue;
                      });
                      _showRouteModal();
                    }
                  },
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Agronomia',
                      child: Text('Agronomia'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Medicina',
                      child: Text('Medicina'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Ingenieria',
                      child: Text('Ingenieria'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Cs Sociales',
                      child: Text('Cs Sociales'),
                    ),
                  ],
                ),
                DropdownButton<String>(
                  value: selectedValueBottom,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedValueBottom = newValue;
                      });
                    }
                  },
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
                ),
              ],
            ),
          ),
        ],
      ),
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
