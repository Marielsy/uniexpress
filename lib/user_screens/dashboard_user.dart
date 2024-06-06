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
  String selectedValueTop = 'Agronomia';
  String selectedValueBottom = 'Av.Bolivar';

  final markers = [
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
            options: const MapOptions(
              initialCenter: myPosition,
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
              MarkerLayer(
                markers: markers,
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
            print('Selected route: ${routeList[index]}');
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
