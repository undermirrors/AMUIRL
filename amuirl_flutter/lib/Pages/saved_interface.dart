import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/game_map.dart';
import 'package:amuirl_flutter/Pages/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'file_manager.dart';

class SavedInterface extends StatefulWidget {
  final GameMap map;
  final Lobby currentLobby;
  const SavedInterface({super.key, required this.map, required this.currentLobby});

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
                  "Sauvegarder des marqueurs",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          Column(
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
                    context.read<CreationPageChangeProvider>().changeToTaskSelector(lobby: widget.currentLobby)        ,
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
          ]
        ),
      )
    );
  }
}