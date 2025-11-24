import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CategoryMap extends StatefulWidget {
  final LatLng latLong;

  const CategoryMap({
    super.key,
    required this.latLong,
  });

  @override
  State<CategoryMap> createState() => CategoryMapState();
}

class CategoryMapState extends State<CategoryMap> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: widget.latLong,
          zoom: 14.5,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}