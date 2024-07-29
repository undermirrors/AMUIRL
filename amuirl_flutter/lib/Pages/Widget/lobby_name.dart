// ignore_for_file: use_build_context_synchronously

import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/Widget/GameCreation/lobby_creation.dart';
import 'package:amuirl_flutter/Pages/Utils/lobby_value_basics.dart';
import 'package:amuirl_flutter/main.dart';
import 'package:flutter/material.dart';

class LobbyName extends StatefulWidget {
  const LobbyName({super.key});

  @override
  State<LobbyName> createState() => _LobbyNameState();
}

class _LobbyNameState extends State<LobbyName> {

  String? _errorMessage;
  final TextEditingController nameLobby = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],

      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(20.0),
            alignment: Alignment.bottomLeft,
            child: const Icon(
              Icons.arrow_back,
              size: 25.0,
            ),
          ),
        ),
        title: Container(
          alignment: const Alignment(-0.125, 0),
          child: const Text(
            "Création de partie",
            style: TextStyle(
              fontSize: 36,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),


      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(30),
              child: TextField(
                controller: nameLobby,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Entrez ici le nom de votre lobby...",
                ),
              ),
            ),

            GestureDetector(
                onTap: () async {
                  if (currentUser == null) {
                    Navigator.pushNamed(context, '/user_connexion');
                  } else {
                    _errorMessage = null;
                    if (nameLobby.text.length < 33 &&
                        nameLobby.text.length > 3) {
                      try {
                        await client.lobbies.createLobby(
                            Lobby(
                              name: nameLobby.text,
                              nbPlayer: 1,
                              players: <String>[currentUser!.name],
                              gameParameter: LobbyValueBasics.defaultValues,
                              gameLaunched: false,
                            )
                        );
                        List<Lobby> newLobby = await client.lobbies.getAllLobby(keyword: nameLobby.text);
                        Lobby lobby = newLobby[0];
                        await client.users.enterIntoLobby(currentUser!.name, lobby.id!);
                        updateUser(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LobbyCreation(currentLobby: lobby)));
                      } catch (e) {
                        setState(() {
                          _errorMessage = '$e';
                        });
                      }
                    }
                  }
                },
                child: Container(
                  height: 100,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 4,
                    ),
                  ),
                  child: const Text(
                    "Créer le lobby",
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                )
            ),

            _errorMessage != null ?
            (
                Container(
                margin: const EdgeInsets.all(20),
                width: 500,
                height: 300,
                padding: const EdgeInsets.all(20),
                color: Colors.red,
                alignment: Alignment.center,
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ) : Container(),
          ]
      ),
    );
  }
}