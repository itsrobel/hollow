import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

@override
Widget build(BuildContext context) {
  return FlutterMap(
    options: MapOptions(
      center: latLng.LatLng(51.5, -0.09),
      zoom: 13.0,
    ),
    layers: [
      TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a', 'b', 'c'],
        attributionBuilder: (_) {
          return Text("© OpenStreetMap contributors");
        },
      ),
      MarkerLayerOptions(
        markers: [
          Marker(
            width: 80.0,
            height: 80.0,
            point: latLng.LatLng(51, -9),
            builder: (ctx) => Container(
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    ],
  );
}
