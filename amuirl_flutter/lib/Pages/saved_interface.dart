import 'package:amuirl_flutter/Pages/game_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import 'file_manager.dart';

class SavedInterface extends StatefulWidget {
  final GameMap map;
  const SavedInterface({super.key, required this.map});

  @override
  State<SavedInterface> createState() => _SavedInterfaceState();
}
class _SavedInterfaceState extends State<SavedInterface> {
  final TextEditingController nameFile = TextEditingController();

  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: Container(
          alignment: Alignment.center,
          child: const Text("Sauvergarder les marqueurs"),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Entrez ici votre nom de Sauvegarde"),

            TextField(
              controller: nameFile,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Entrez ici le nom de votre sauvegarde...",
              ),
            ),

            GestureDetector(
              onTap: () async => {
                await writeSavedMap(widget.map, nameFile.text),
                Navigator.pop(context),
              },
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 200,
                margin: const EdgeInsets.all(20),
                color: Colors.grey,
                child: const Text(
                  "Sauvergarder",
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