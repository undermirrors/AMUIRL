import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/Utils/game_creation_map.dart';
import 'package:amuirl_flutter/Pages/Widget/game.dart';
import 'package:amuirl_flutter/Pages/Widget/GameCreation/map_widget.dart';
import 'package:amuirl_flutter/Pages/Utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../Utils/file_manager.dart';

LatLng? fromLoadedMap;

class TaskSelector extends StatefulWidget {
  Lobby currentLobby;
  TaskSelector({super.key, required this.currentLobby});

  @override
  State<TaskSelector> createState() => _TaskSelectorState();
}

class _TaskSelectorState extends State<TaskSelector> {
  GlobalKey<ScaffoldState> scaffoldTaskKey = GlobalKey<ScaffoldState>();

  int nbTask = 0;
  int newMarker = 0;
  int? selectedMarker;
  bool markerAlreadyApprovedOnce = false;

  void taskLeftToPlace(int taskPlaced) async {
    updateUser(context);
    if (currentUser != null) {
      var lobby = await client.lobbies.getLobby(widget.currentLobby.id!);
      if (lobby != null) {
        setState(() {
          widget.currentLobby = lobby;
          nbTask = lobby.gameParameter[6] - taskPlaced;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var taskPlaced = context.watch<MapProvider>().map.taskMarkerCoord.length;
    taskLeftToPlace(taskPlaced);
    if (newMarker != 0) {
      if (markerAlreadyApprovedOnce) {
        newMarker = 0;
        selectedMarker = null;
      } else {
        markerAlreadyApprovedOnce = true;
      }
    }

    return Scaffold(
      backgroundColor: Colors.blue[50],
      key: scaffoldTaskKey,
      endDrawer: Drawer(
        child:
        Column(
          children: [
            DrawerHeader(
              child: Container(
                alignment: Alignment.center,
                width: 235,
                height: 100,
                child: const Text(
                  "Options avancées",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              child: ListTile(
                leading: const Icon(Icons.file_copy),
                title: const Text("S A U V E G A R D E R"),
                onTap: () async {
                  GameMap savedMap = context.read<MapProvider>().map;
                  context.read<CreationPageChangeProvider>().changeToSavedInterface(map: savedMap, lobby: widget.currentLobby);
                },
              )
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              child: ListTile(
                leading: const Icon(Icons.file_download_sharp),
                title: const Text("C H A R G E R"),
                onTap: () async {
                  String path = await localPath;
                  context.read<CreationPageChangeProvider>().changeToLoadInterface(path: path, lobby: widget.currentLobby);
                },
              ),
            ),
          ]
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<MapProvider>().clear(); // We clear the map when we return to the previous page
                    context.read<CreationPageChangeProvider>().changeToGameSettings(lobby: widget.currentLobby);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 35.0),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 30.0),
                  height: 50,
                  width: 250,
                  child: const Text(
                    "Selection des tâches",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    scaffoldTaskKey.currentState?.openEndDrawer();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 35.0),
                    child: const Icon(Icons.menu),
                  ),
                ),
              ],
            ),

            Text(
              "nombre de tâches restantes à placer : $nbTask",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),

            Container(
              alignment: Alignment.center,
              height: 500,
              width: 450,
              child: MapWidget(newMarker: newMarker, selectedMarker: selectedMarker),
            ),

            Container(
              height: 50,
              width: 420,
              padding: const EdgeInsets.all(5.0),
              color: Colors.black,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  if(context.watch<MapProvider>().map.lobbyMarkerPos != null)
                    GestureDetector(
                      onTap: () => {
                        if (selectedMarker == -1) {
                          selectedMarker = null
                        } else {
                          selectedMarker = -1
                        }
                      },
                    child :Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(5),
                      color: selectedMarker == -1 ? Colors.blueGrey : Colors.blueGrey[800],
                      child: const Icon(Icons.warehouse_rounded),
                    ),
                  ),

                  if (context.watch<MapProvider>().map.taskMarkerCoord.isNotEmpty)
                    for (int i = 0; i < context.watch<MapProvider>().map.taskMarkerCoord.length; i++)
                      GestureDetector(
                        onTap: () => {
                          if (selectedMarker == i) {
                            selectedMarker = null
                          } else {
                            selectedMarker = i
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.all(5),
                          color: selectedMarker == i ? Colors.blueGrey: Colors.blueGrey[800],
                          child: const Icon(Icons.build_circle),
                        ),
                      ),
                ],
              )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    newMarker = 1;
                    markerAlreadyApprovedOnce = false;
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40.0),
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[300],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Icon(
                      Icons.warehouse_rounded,
                      size: 50,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    newMarker = 3;
                    if (selectedMarker == -1) {
                    }
                    markerAlreadyApprovedOnce = false;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[300],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Icon(
                      Icons.delete,
                      size: 30,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    if (nbTask > 0) {
                      newMarker = 2;
                      markerAlreadyApprovedOnce = false;
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40.0),
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[300],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Icon(
                      Icons.build,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                print(nbTask);
                if (context.read<MapProvider>().map.lobbyMarkerPos != null && nbTask == 0) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                      GameInterface(currentLobby: widget.currentLobby,)));
                } else {
                  print("You can't start the game without have all the task");
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 400,
                decoration: (nbTask == 0 && context.read<MapProvider>().map.lobbyMarkerPos != null)
                  ? BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 200, 200, 200),
                        Color.fromARGB(255, 150, 150, 150),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 4,
                    ),
                  )
                  : BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 4,
                    ),
                  ),
                child: const Text(
                  "Démarrer la partie",
                  style: TextStyle(
                    fontSize: 30,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}