import 'dart:io';

import 'package:amuirl_client/amuirl_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../main.dart';
import '../Utils/maps_utils.dart';

Game? game;
Position? currentLocation;
bool servicePermission = false;
late LocationPermission permission;
final MapController mapController = MapController();

Future<bool> getCurrentLocation() async {
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    return false;
  }
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

class GameInterface extends StatefulWidget {
  final bool isCreator;
  final String currentGame;
  const GameInterface({super.key, required this.isCreator, required this.currentGame});

  @override
  State<GameInterface> createState() => _GameInterfaceState();
}

class _GameInterfaceState extends State<GameInterface> {
  double zoom = 17.0;
  List<Marker> markers = [];

  void setGame(currentGame) async {
    game = await client.game.getGame(currentGame);
    print (game != null);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      print("here");
      setGame(widget.currentGame);
    });

    if (game != null) {
      updateUser(context);
      int indexOfCurrentPlayer = game!.players.indexOf(currentUser!.name);
      var taskLocation = game!.taskLeftForEachPlayers[indexOfCurrentPlayer];
      if (taskLocation.isNotEmpty) {
        markers.clear();
        markers.add(
            createMarker(
                LatLng(
                    game!.startedPoint.latitude,
                    game!.startedPoint.longitude),
                const Icon(
                    Icons.warehouse_rounded,
                    color: Colors.black
                )
            )
        );
        for (int i = 0; i < taskLocation.length; i++) {
          markers.add(
            createMarker(
              LatLng(
                taskLocation[i].latitude,
                taskLocation[i].longitude),
              const Icon(
                Icons.build_circle,
                color: Colors.black
              )
            )
          );
        }
      }
    } else {
      print("alaid");
      setState(() {});
    }

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 400,
              width: 400,
              child: FlutterMap(
                options: MapOptions(
                    initialCenter: const LatLng(45.94954, 5.42839),
                    initialZoom: zoom,
                    // onTap: (TapPosition tapPosition, LatLng pos) => {temporaryMarkerPos = LatLng(pos.latitude, pos.longitude)}
                ),
                mapController: mapController,
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',          // Plenty of other options available!
                  ),

                  MarkerLayer(markers: markers),

                  CurrentLocationLayer(),

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
                            mapController.move(LatLng(currentLocation!.latitude, currentLocation!.longitude), zoom);
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
              ),
            ),

            Text("imposteurs : ${game?.indexOfImpostors}"),

            Text("joueurs : ${game?.players}"),

            Text("distance de meurtres : ${game?.killDistance}"),

            Text("nombres disponible d'urgences : ${game?.nbUrgencyCall}"),

            Text("lobby alerte activé : ${game?.startedPointTriggered}"),

            Text("temps de discution/vote : ${game?.timeDiscutionVote}"),

            Text("temps entre chaque meurtres d'un imposteur : ${game?.cooldownKillByImpostors}"),

            Text("toutes les taches disponibles : ${game?.totalTask}"),

            Text("joueurs : ${game?.players}"),
          ],
        ),
      ),
    );
  }

}