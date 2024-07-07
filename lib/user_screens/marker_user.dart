import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// ignore: must_be_immutable
class MarkersPoints extends StatelessWidget {
  MarkersPoints({super.key});

  // ignore: constant_identifier_names
  static const String MAPBOX_ACCESS_TOKEN =
      'pk.eyJ1IjoiY2FydmFqYWxtYXJpZWxzeSIsImEiOiJjbHZyOWdkZGEwa2JlMmttZzNuZ2V3Nm52In0.XzknMqNCOBNtUgnHKvCHhg';

  List<double> currentLocation = [
    9.917715,
    -67.368376
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates() {
    return [
      const LatLng(
          9.917715, -67.368376), // Ejemplo de coordenadas de marcadores
    ];
  }

  List<double> currentLocation2 = [
    9.917373,
    -67.368792
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates2() {
    return [
      const LatLng(9.917373, -67.368792),
    ];
  }

  List<double> currentLocation3 = [
    9.917001,
    -67.369236
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates3() {
    return [
      const LatLng(9.917001, -67.369236),
    ];
  }

  List<double> currentLocation4 = [
    9.916527,
    -67.369788
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates4() {
    return [
      const LatLng(
          9.916527, -67.369788), // Ejemplo de coordenadas de marcadores
    ];
  }

  List<double> currentLocation5 = [
    9.915836,
    -67.370636
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates5() {
    return [
      const LatLng(9.915836, -67.370636),
    ];
  }

  List<double> currentLocation6 = [
    9.915426,
    -67.372254
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates6() {
    return [
      const LatLng(9.915426, -67.372254),
    ];
  }

  List<double> currentLocation7 = [
    9.914967,
    -67.373376
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates7() {
    return [
      const LatLng(9.914967, -67.373376),
    ];
  }

  List<double> currentLocation8 = [
    9.913634,
    -67.375719
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates8() {
    return [
      const LatLng(9.913634, -67.375719),
    ];
  }

  List<double> currentLocation9 = [
    9.911506,
    -67.377935
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates9() {
    return [
      const LatLng(9.911506, -67.377935),
    ];
  }

  List<double> currentLocation10 = [
    9.909865,
    -67.379617
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates10() {
    return [
      const LatLng(9.909865, -67.379617),
    ];
  }

  List<double> currentLocation11 = [
    9.906994,
    -67.381097
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates11() {
    return [
      const LatLng(9.906994, -67.381097),
    ];
  }

  List<double> currentLocation12 = [
    9.903473,
    -67.386904
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates12() {
    return [
      const LatLng(9.903473, -67.386904),
    ];
  }

  List<double> currentLocation13 = [
    9.901327,
    -67.391383
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates13() {
    return [
      const LatLng(9.901327, -67.391383),
    ];
  }

  List<double> currentLocation14 = [
    9.901980,
    -67.394104
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates14() {
    return [
      const LatLng(9.901980, -67.394104),
    ];
  }

  List<double> currentLocation15 = [
    9.901865,
    -67.394800
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates15() {
    return [
      const LatLng(9.901865, -67.394800),
    ];
  }

  List<double> currentLocation16 = [
    9.901737,
    -67.395382
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates16() {
    return [
      const LatLng(9.901737, -67.395382),
    ];
  }

  List<double> currentLocation17 = [
    9.900552,
    -67.395472
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates17() {
    return [
      const LatLng(9.900552, -67.395472),
    ];
  }

  List<double> currentLocation18 = [
    9.900313,
    -67.395900
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates18() {
    return [
      const LatLng(9.900313, -67.395900),
    ];
  }

  List<double> currentLocation19 = [
    9.900713,
    -67.396415
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates19() {
    return [
      const LatLng(9.900713, -67.396415),
    ];
  }

  List<double> currentLocation20 = [
    9.900811,
    -67.397035
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates20() {
    return [
      const LatLng(9.900811, -67.397035),
    ];
  }

  List<double> currentLocation21 = [
    9.900498,
    -67.397374
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates21() {
    return [
      const LatLng(9.900498, -67.397374),
    ];
  }

  List<double> currentLocation22 = [
    9.899979,
    -67.397324
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates22() {
    return [
      const LatLng(9.899979, -67.397324),
    ];
  }

  List<double> currentLocation23 = [
    9.898135,
    -67.391306
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates23() {
    return [
      const LatLng(9.898135, -67.391306),
    ];
  }

  List<double> currentLocation24 = [
    9.893394,
    -67.385819
  ]; // Ejemplo de coordenadas de ubicación actual

  List<LatLng> getCoordinates24() {
    return [
      const LatLng(9.893394, -67.385819),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
              MarkerLayer(
                markers: [
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
                    point: LatLng(currentLocation6[0], currentLocation6[1]),
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
                      Icons.location_pin,
                      size: 40.0,
                      color: Color.fromRGBO(65, 75, 178, 1),
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
                ],
              ),
            ],
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
