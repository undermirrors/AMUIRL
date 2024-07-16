import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';


class MapWidget extends StatefulWidget {
  const MapWidget(
      {super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> with TickerProviderStateMixin {
  Position? currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;

  @override
  Widget build(BuildContext context) {

    return FlutterMap(
      options: MapOptions(
        initialCenter: const LatLng(45.94954, 5.42839),
        initialZoom: 17,
        onTap: (TapPosition tapPosition, LatLng pos) => {
          print(pos),
        }
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',          // Plenty of other options available!
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            )
          ],
        )
      ],
    );
  }
}