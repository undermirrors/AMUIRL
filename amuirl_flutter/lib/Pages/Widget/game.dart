import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../Utils/maps_utils.dart';
import '../Utils/providers.dart';

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
  bool roleVisible = false;
  int selectedMarker = -1;
  bool gameEnded = false;

  void setGame(String currentGame) async {
    var game = await client.game.getGame(currentGame);
    if (game != null) {
      context.read<GameProvider>().modifyGame(changedGame: game);
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    setGame(widget.currentGame);

    if (context.read<GameProvider>().game != null) {
      updateUser(context);
      int indexOfCurrentPlayer = context.read<GameProvider>().game!.players.indexOf(currentUser!.name);
      var taskLocation = context.read<GameProvider>().game!.taskLeftForEachPlayers[indexOfCurrentPlayer];
      if (taskLocation.isNotEmpty) {
        markers.clear();
        markers.add(
          createMarker(
            LatLng(
              context.read<GameProvider>().game!.startedPoint.latitude,
              context.read<GameProvider>().game!.startedPoint.longitude),
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
              GestureDetector(
                onTap: () => {
                  setState(() {
                    if (selectedMarker == i) {
                      selectedMarker = -1;
                    } else {
                      selectedMarker = i;
                    }
                  }),
                },
                child: Icon(
                  Icons.build_circle,
                  color: (selectedMarker == i) ? Colors.red : Colors.black
                )
              ),
            )
          );
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(60, 50, 50, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage("lib/assets/user.jpg"), // TODO
                        fit: BoxFit.cover,
                      )
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.blue[100],
                    ),
                    width: 200,
                    height: 150,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          width: 170,
                          height: 90,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                currentUser!.name,
                                style: const TextStyle(
                                  fontSize: 30,
                                ),
                              ),

                              if (context.read<GameProvider>().isImpostor(playerName: currentUser!.name) != null)
                                Visibility(
                                  visible: roleVisible,
                                  child: Text(
                                    "Role : ${(context.read<GameProvider>().isImpostor(playerName: currentUser!.name)!) ? "Impostor" : "Crewmate"}",
                                  ),
                                ),
                            ]
                          ),
                        ),

                        GestureDetector(
                          onTap: () => {
                            setState(() {
                              roleVisible = !roleVisible;
                            })
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all()
                            ),
                            alignment: Alignment.center,
                            width: 100,
                            height: 30,
                            child: Text(
                              roleVisible ? "Cacher rôle" : "Afficher rôle"
                            )
                          )
                        )
                      ],
                    ),
                  ),
                ]
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.face
                    ),

                    Text(
                        ": ${context.read<GameProvider>().game!.players.length - context.read<GameProvider>().game!.playersDead.length}"
                    ),
                  ]
                ),

                Row(
                  children: [
                    const Icon(
                        Icons.location_searching
                    ),

                    Text(
                        ": ${context.read<GameProvider>().game!.indexOfImpostors.length}"
                    ),
                  ]
                ),

                Row(
                  children: [
                    const Icon(
                        Icons.build_circle_outlined
                    ),

                    Text(
                        ": ${context.read<GameProvider>().recupAllTaskLeft()}"
                    ),
                  ]
                ),
              ],
            ),


            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30),
              height: 450,
              width: 400,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: const LatLng(45.94954, 5.42839),
                  initialZoom: zoom,
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
                            mapController.move(
                                LatLng(
                                    currentLocation!.latitude,
                                    currentLocation!.longitude),
                                zoom
                            );
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
                        margin: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.my_location,
                          size: 40,
                        ),
                      ),
                    ),
                  ),

                  if (selectedMarker != -1)
                    Container(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () async => {
                          await client.game.finishTask(
                              context.read<GameProvider>().game!.name,
                              currentUser!.name,
                              selectedMarker
                          ),
                          setState(() {
                            selectedMarker = -1;
                          })
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey
                              )
                          ),
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          child : const Icon(
                            Icons.delete,
                            size: 20,
                          )
                        ),
                      ),
                    ),
                ],
              ),
            ),

            GestureDetector(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10),
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all()
                ),
                alignment: Alignment.center,
                width: 180,
                height: 60,
                child : const Text(
                  "Lancer l'alerte !",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ),
            ),

            if (context.read<GameProvider>().recupAllTaskLeft() == 0)
              GestureDetector(
                onTap: () async => {
                  client.game.endGame(context.read<GameProvider>().game!.name),
                  Navigator.pushNamed(context, '/main_menu')
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all()
                  ),
                  alignment: Alignment.center,
                  width: 180,
                  height: 60,
                  child : const Text(
                    "Quitter la partie",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ),
              ),

            if (context.read<GameProvider>().recupAllTaskLeft() == 0)
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  alignment: Alignment.center,
                  width: 200,
                  height: 60,
                  child : const Text(
                    "Partie Terminé !!",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )
              ),
          ],
        ),
      ),
    );
  }
}