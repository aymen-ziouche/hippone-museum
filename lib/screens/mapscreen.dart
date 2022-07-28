import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
  static String id = "MapScreen";

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(36.8822102056732, 7.751952529350091),
    zoom: 15,
  );
  static const _initialMarker = Marker(
    markerId: MarkerId("1"),
    position: LatLng(36.8822102056732, 7.751952529350091),
    infoWindow: InfoWindow(
      title: "Hippone",
      snippet: "Hippone Museum",
    ),
  );
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}
