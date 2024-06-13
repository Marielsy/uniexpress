import 'package:flutter/material.dart';

import 'dart:async';

class MarkerPoint extends StatelessWidget {
  const MarkerPoint({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: getCoordinates().map((coord) {
        return ListTile(
          title: Text('Latitud: ${coord[0]}, Longitud: ${coord[1]}'),
        );
      }).toList(),
    );
  }
}
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

void main() {
  List<List<double>> coordinates = getCoordinates();

  Future<void> delayPrint(List<double> coord) async {
    await Future.delayed(const Duration(seconds: 1));
    // ignore: avoid_print
    print('Latitud: ${coord[0]}, Longitud: ${coord[1]}');
  }

  Future<void> loopWithDelay() async {
    for (List<double> coord in coordinates) {
      await delayPrint(coord);
    }
  }

  loopWithDelay();
}
