import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../main.dart';
import 'game.dart';
import 'package:flutter_map/flutter_map.dart';

class TaskSelector extends StatefulWidget {
  Lobby currentLobby;
  TaskSelector({super.key, required this.currentLobby});

  @override
  State<TaskSelector> createState() => _TaskSelectorState();
}

class _TaskSelectorState extends State<TaskSelector> {
  int nbTask = 0;
  bool startingPointPlaced = false;

  void taskLeftToPlace() async {
    updateUser(context);
    if (currentUser != null) {
      var lobby = await client.lobbies.getLobby(widget.currentLobby.id!);
      if (lobby != null) {
        setState(() {
          widget.currentLobby = lobby;
          nbTask = lobby.gameParameter[6];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      taskLeftToPlace();
    });
    return Scaffold(
      appBar: AppBar(
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
              height: 600,
              width: 450,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const MapWidget(),
            ),

            if (startingPointPlaced)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      startingPointPlaced = false;
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      alignment: Alignment.center,
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Text(
                        "-",
                        style: TextStyle(
                          fontSize: 50,
                        )
                      ),
                    ),
                  ),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    alignment: Alignment.center,
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Text(
                        "+",
                        style: TextStyle(
                          fontSize: 50,
                        )
                    ),
                  ),
                ),
              ],
            ),

            if (!startingPointPlaced)
              GestureDetector(
                onTap: () {
                  startingPointPlaced = true;
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  alignment: Alignment.center,
                  height: 100,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Colors.grey[600]!,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    "Ajouter point de départ",
                    style: TextStyle(
                      fontSize: 27,
                    )
                  ),
                ),
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