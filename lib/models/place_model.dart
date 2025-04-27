import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;

  PlaceModel({required this.id, required this.name, required this.latLng});
}

List<PlaceModel> places = [
  PlaceModel(
    id: 1,
    name: "first",
    latLng: LatLng(31.187084851056554, 29.9281105268),
  ),
  PlaceModel(id: 2, name: "second", latLng: LatLng(31.2333344, 29.955555555)),
  PlaceModel(id: 3, name: "thaird", latLng: LatLng(31.24444444, 29.9666666)),
];
