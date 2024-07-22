import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/Utils/game_creation_map.dart';
import 'package:amuirl_flutter/Pages/Utils/providers.dart';
import 'package:amuirl_flutter/Pages/Widget/GameCreation/task_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utils/file_manager.dart';

class LoadInterface extends StatefulWidget {
  final String path;
  final Lobby currentLobby;
  const LoadInterface({super.key, required this.path, required this.currentLobby});

  @override
  State<LoadInterface> createState() => _LoadInterfaceState();
}
class _LoadInterfaceState extends State<LoadInterface> {
  GameMap? map;
  List<String> savedFile = <String>[];
  int? selectedFile;
  String? loadingMap;

  @override
  build(BuildContext context) {
    savedFile = recupAllFilesPath("${widget.path}/saveFile");
    return Scaffold(
      backgroundColor: Colors.blue[50],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 100,
              width: 400,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => {
                      context.read<CreationPageChangeProvider>().changeToTaskSelector(lobby: widget.currentLobby)
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.fromLTRB(0.0, 35.0, 70.0, 40.0),
                      child: const Icon(
                        Icons.arrow_back,
                        size:30,
                      ),
                    ),
                  ),

                  const Text(
                    "Charger des marqueurs",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[400],
                      borderRadius: BorderRadius.circular(10)
                  ),

                  child: Center(
                    child: ListView.builder(
                      itemCount: savedFile.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => {
                            if (selectedFile == index) {
                              setState(() {
                                selectedFile = null;
                              })
                            } else {
                              setState(() {
                                selectedFile = index;
                              })
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                              color: (selectedFile == index) ? Colors.blueGrey[200] : Colors.blueGrey[300],
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text(
                              savedFile[index],
                              style: const TextStyle(
                                fontSize: 30,
                              ),
                            )
                          )
                        );
                      },
                    )
                  )
                ),

                GestureDetector(
                    onTap: () async => {
                      if (selectedFile != null) {
                        loadingMap = savedFile[selectedFile!],
                        map = await readSaveMap(loadingMap!),
                        if (map != null) {
                          context.read<MapProvider>().changeMap(newMap: map!),
                          print("mapLoaded !"),

                          if(map!.lobbyMarkerPos != null) {
                            fromLoadedMap = map!.lobbyMarkerPos,
                          } else {
                            fromLoadedMap = map!.taskMarkerCoord.first
                          },

                          context.read<CreationPageChangeProvider>().changeToTaskSelector(lobby: widget.currentLobby)
                        } else {
                          print("cannot load map")
                        }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 100,
                      margin: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 30.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[200],
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: const Text(
                        "Charger",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    )
                ),

                GestureDetector(
                    onTap: () async => {
                      if (selectedFile != null) {
                        loadingMap = savedFile[selectedFile!],
                        await deleteSaveMap(loadingMap!),
                        setState(() {})
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 100,
                      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 100.0),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[200],
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: const Text(
                        "Supprimer",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    )
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}