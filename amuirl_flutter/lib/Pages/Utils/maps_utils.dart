import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

Marker createMarker(LatLng pos, Icon icon) {
  return Marker(
      alignment: Alignment.center,
      point: pos,
      child: icon
  );
}