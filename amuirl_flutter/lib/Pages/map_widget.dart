import 'package:amuirl_flutter/Pages/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
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
  final int? selectedMarker;
  const MapWidget({super.key, required this.newMarker, required this.selectedMarker});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Marker? positionPlayer;
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
          context.read<MapProvider>().changeLobbyPos(lobbyPos: temporaryMarkerPos!);
          setState(() {
            temporaryMarkerPos = null;
          });
          break;
        case 2:
          setState(() {
            context.read<MapProvider>().addTaskPos(taskPos: temporaryMarkerPos!);
            temporaryMarkerPos = null;
          });
        default:
          break;
      }
    } else {
      if (widget.newMarker == 3) {
        setState(() {
          if (widget.selectedMarker != null) {
            if (widget.selectedMarker == -1) {
              context.read<MapProvider>().changeLobbyPos(lobbyPos: null);
            } else {
              context.read<MapProvider>().deleteTaskPos(index: widget.selectedMarker!);
            }
          }
          temporaryMarkerPos = null;
        });
      }
    }

    List<Marker> markers = [];
    if (context.watch<MapProvider>().map.lobbyMarkerPos != null) {
      markers.add(
        createMarker(
          context.watch<MapProvider>().map.lobbyMarkerPos!,
          Icon(
            Icons.warehouse_rounded,
            color: (widget.selectedMarker != -1) ? Colors.black : Colors.red
          )
        )
      );
    }
    if (temporaryMarkerPos != null) {
      markers.add(
        createMarker(
          temporaryMarkerPos!,
          const Icon(Icons.circle_outlined)
        )
      );
    }
    for (int i = 0; i < context.watch<MapProvider>().map.taskMarkerCoord.length; i++) {
      markers.add(
        createMarker(
          context.watch<MapProvider>().map.taskMarkerCoord[i],
          Icon(
            Icons.build_circle,
            color: (widget.selectedMarker != i) ? Colors.black : Colors.red)
        )
      );
    }

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