import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

Position? currentLocation;
bool servicePermission = false;
late LocationPermission permission;
final MapController mapController = MapController();

Future<bool> getCurrentLocation() async {
  servicePermission = await Geolocator.isLocationServiceEnabled();
  if (!servicePermission) {
    print("service disabled");
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  currentLocation = await Geolocator.getCurrentPosition();
  return currentLocation != null;
}

class MapWidget extends StatefulWidget {
  final int newMarker;
  const MapWidget({super.key, required this.newMarker});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Marker? positionPlayer;
  Marker? lobbyMarker;
  List<Marker> savedMarker = [];
  LatLng? temporaryMarkerPos;
  double zoom = 17.0;

  Marker createMarker(LatLng pos, Icon icon) {
    return Marker(alignment: Alignment.center, point: pos, child: icon);
  }

  @override
  build(BuildContext context) {
    getCurrentLocation();

    if (temporaryMarkerPos != null) {
      switch (widget.newMarker) {
        case 0:
          break;
        case 1:
          setState(() {
            lobbyMarker = createMarker(
                temporaryMarkerPos!,
                const Icon(Icons.warehouse_rounded)
            );
            temporaryMarkerPos = null;
          });
          break;
        case 2:
          setState(() {
            savedMarker.add(
              createMarker(
                temporaryMarkerPos!,
                const Icon(Icons.build_circle)
              )
            );
          });
          temporaryMarkerPos = null;
        default:
          break;
      }
    }

    List<Marker> markers = [];
    if (lobbyMarker != null) {
      markers.add(lobbyMarker!);
    }
    if (temporaryMarkerPos != null) {
      markers.add(
        createMarker(
          temporaryMarkerPos!,
          const Icon(Icons.circle_outlined)
        )
      );
    }
    markers.addAll(savedMarker);

    return FlutterMap(
      options: MapOptions(
        initialCenter: const LatLng(45.94954, 5.42839),
        initialZoom: zoom,
        onTap: (TapPosition tapPosition, LatLng pos) => {
          setState(() {
            temporaryMarkerPos = LatLng(pos.latitude, pos.longitude);
          })
        }
      ),
      mapController: mapController,
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
        ),

        MarkerLayer(markers: positionPlayer == null ? markers : markers + <Marker>[positionPlayer!]),


        Container(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => {
                  setState(() {
                    zoom -= 0.5;
                    mapController.move(mapController.camera.center, zoom);
                  })
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: const Icon(
                    Icons.remove,
                    size: 30,
                  )
                )
              ),

              GestureDetector(
                  onTap: () => {
                    setState(() {
                      zoom += 0.5;
                      mapController.move(mapController.camera.center, zoom);
                    })
                  },
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      )
                  )
              ),
            ],
          )
        ),

        Container(
          alignment: Alignment.bottomLeft,
          child: GestureDetector(
            onTap: () async => {
              if (await getCurrentLocation()) {
                setState(() {
                  positionPlayer = Marker(
                    alignment: Alignment.center,
                    point: LatLng(currentLocation!.latitude, currentLocation!.longitude),
                    child: const Icon(
                      Icons.square,
                      color: Colors.red,
                    )
                  );
                  mapController.move(LatLng(currentLocation!.latitude, currentLocation!.longitude), zoom);
                })
              } else {
                setState(() {
                  positionPlayer = null;
                })
              }
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 2.0,
                ),
              ),
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              child: const Icon(
                Icons.my_location,
                size: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}