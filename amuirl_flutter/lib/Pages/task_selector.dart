import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../main.dart';
import 'game.dart';


List<LatLng> taskMarkerCoord = [];

class TaskSelector extends StatefulWidget {
  Lobby currentLobby;
  TaskSelector({super.key, required this.currentLobby});

  @override
  State<TaskSelector> createState() => _TaskSelectorState();
}

class _TaskSelectorState extends State<TaskSelector> {
  int nbTask = 0;
  bool startingPointPlaced = false;
  int newMarker = 0;
  int? selectedMarker;
  bool markerAlreadyApprovedOnce = false;

  void taskLeftToPlace() async {
    updateUser(context);
    if (currentUser != null) {
      var lobby = await client.lobbies.getLobby(widget.currentLobby.id!);
      if (lobby != null) {
        setState(() {
          widget.currentLobby = lobby;
          nbTask = lobby.gameParameter[6] - taskMarkerCoord.length;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      taskLeftToPlace();
      if (newMarker != 0) {
        if (markerAlreadyApprovedOnce) {
          newMarker = 0;
          selectedMarker = null;
        } else {
          markerAlreadyApprovedOnce = true;
        }
      }
    });

    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: const Text("Selection des tâches"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                  if(startingPointPlaced)
                    GestureDetector(
                      onTap: () => {
                        setState(() {
                          if (selectedMarker == -1) {
                            selectedMarker = null;
                          } else {
                            selectedMarker = -1;
                          }
                        })
                      },
                    child :Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(5),
                      color: selectedMarker == -1 ? Colors.blueGrey : Colors.blueGrey[800],
                      child: const Icon(Icons.warehouse_rounded),
                    ),
                  ),

                  if (taskMarkerCoord.isNotEmpty)
                    for (int i = 0; i < taskMarkerCoord.length; i++)
                      GestureDetector(
                        onTap: () => {
                          setState(() {
                            if (selectedMarker == i) {
                              selectedMarker = null;
                            } else {
                              selectedMarker = i;
                            }
                          })
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
                    setState(() {
                      newMarker = 1;
                      markerAlreadyApprovedOnce = false;
                      startingPointPlaced = true;
                    });
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
                    setState(() {
                      newMarker = 3;
                      if (selectedMarker == -1) {
                        startingPointPlaced = false;
                      }
                      markerAlreadyApprovedOnce = false;
                    });
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
                      setState(() {
                        newMarker = 2;
                        markerAlreadyApprovedOnce = false;
                      });
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
                if (startingPointPlaced) {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          Game(currentLobby: widget.currentLobby,)));
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 200, 200, 200),
                      Color.fromARGB(255, 150, 150, 150),
                    ]
                  ),
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