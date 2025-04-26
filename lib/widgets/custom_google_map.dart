import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key}); 

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  @override
  Widget build(BuildContext context) {
    return const GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(31.1870, 29.92),
    zoom: 10

    ),



    );
  }
}
