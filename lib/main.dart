import 'package:flutter/material.dart';
import 'package:flutter_google_maps/widgets/custom_google_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const TestGoogleMapWithFlutter());
}

class TestGoogleMapWithFlutter extends StatelessWidget {
  const TestGoogleMapWithFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
home: CustomGoogleMap(),
    );
  }
}

