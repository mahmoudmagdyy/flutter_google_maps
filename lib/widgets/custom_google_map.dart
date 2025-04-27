import 'package:flutter/material.dart';
import 'package:flutter_google_maps/models/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  Set<Polygon> polygons = {};
  Set<Circle> circles = {};

  @override
  void initState() {
    initMarkers();
    initPolyline();
    initPolygone();
    initCircles();
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  void initMapStyle() async {
    var nightMapStyle = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/map_style.json");
    mapController.setMapStyle(nightMapStyle);
  }

  void initPolyline() {
    Polyline myPolyline = Polyline(
      width: 5,
      startCap: Cap.roundCap,
      polylineId: PolylineId("1"),
      color: Colors.lightGreenAccent,
      points: [
        LatLng(31.187084851056554, 29.9281105268),
        LatLng(31.2333344, 29.955555555),
        LatLng(31.24444444, 29.9666666),
      ],
    );
    polylines.add(myPolyline);
  }

  void initPolygone() {
    Polygon polygon = Polygon(
      polygonId: PolygonId("1"),
      points: [
        LatLng(31.187084851056554, 29.9281105268),
        LatLng(31.2333344, 29.955555555),
        LatLng(31.24444444, 29.9666666),
      ],
      fillColor: Colors.blueAccent,
    );
    polygons.add(polygon);
  }

  void initCircles() {
    Circle circle = Circle(
      circleId: CircleId("1"),
      radius: 10000,
      center: LatLng(31.187084851056554, 29.9281105268),
    );
    circles.add(circle);
  }

  void initMarkers() async {
    BitmapDescriptor customIcon = await BitmapDescriptor.asset(
      ImageConfiguration(),
      "assets/locationicon.png",
      width: 25,
      height: 25,
    );
    var myMarker =
        places
            .map(
              (place) => Marker(
                icon: customIcon,
                infoWindow: InfoWindow(title: place.name),
                markerId: MarkerId(place.id.toString()),
                position: place.latLng,
              ),
            )
            .toSet();
    markers.addAll(myMarker);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          // polylines: polylines,
          // polygons: polygons,
          circles: circles,
          onMapCreated: (controller) {
            mapController = controller;
            initMapStyle();
          },
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
            target: LatLng(31.187084851056554, 29.9281105268),
            zoom: 10,
          ),
          cameraTargetBounds: CameraTargetBounds(
            LatLngBounds(
              southwest: LatLng(31.0805696173267, 29.7634910),
              northeast: LatLng(31.30846738149, 30.16929850),
            ),
          ),
          markers: markers,
        ),
        // Positioned(
        //   bottom: 20,
        //   left: 16,
        //   right: 16,
        //   child: ElevatedButton(
        //     onPressed: () {
        //       mapController.animateCamera(
        //         CameraUpdate.newLatLng(
        //           LatLng(30.187084851056554, 30.19281105268),
        //         ),
        //       );
        //     },
        //     child: Text("Change Position"),
        //   ),
        // ),
      ],
    );
  }
}
