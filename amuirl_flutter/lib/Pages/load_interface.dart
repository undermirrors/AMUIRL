import 'package:amuirl_flutter/Pages/game_map.dart';
import 'package:flutter/material.dart';

import 'file_manager.dart';

class LoadInterface extends StatefulWidget {
  final String path;
  const LoadInterface({super.key, required this.path});

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
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: Container(
          alignment: Alignment.center,
          child: const Text("Charger des marqueurs"),
        ),
      ),

      body: Center(
        child: Column(
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
                        margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
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
                    // Todo
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 100,
                  margin: const EdgeInsets.all(20),
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
                  margin: const EdgeInsets.all(20),
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
      ),
    );
  }
}