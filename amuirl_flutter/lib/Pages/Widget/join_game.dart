import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/main.dart';
import 'package:flutter/material.dart';

import 'lobby_joined_interface.dart';


class JoinGame extends StatefulWidget {
  const JoinGame({super.key});

  @override
  State<JoinGame> createState() => _JoinGameState();
}

class _JoinGameState extends State<JoinGame> {

  ListView selectionsOfLobbies = ListView();
  final TextEditingController nameLobby = TextEditingController();
  int selectedValue = -1;
  int selectedLobbyId = 0;
  int selectedLobbyNbPlayer = 0;
  Lobby? lobby;

  void addPlayer(int idLobby) async {
    if (currentUser != null) {
      await client.users.enterIntoLobby(currentUser!.name, idLobby);
      await client.lobbies.addPlayer(idLobby, currentUser!);
      // ignore: use_build_context_synchronously
      updateUser(context);
    } else {
      Navigator.pushNamed(context, '/user_connexion');
    }
  }

  void recupLobbies(String lobbyResearch) async {
    try {
      var allLobbies = await client.lobbies.getAllLobby(keyword: lobbyResearch);
      List<Lobby> lobbies = [];
      if (allLobbies.isNotEmpty) {
        lobbies.clear();
        for (int i = 0; i < allLobbies.length; i++) {
          if (!allLobbies[i].gameLaunched) {
            lobbies.add(allLobbies[i]);
          }
        }
      }

      if (lobbies.isNotEmpty) {
        setState(() {
          selectionsOfLobbies = ListView.builder(
            itemCount: lobbies.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => {
                  setState(() {
                    selectedValue = index;
                    selectedLobbyId = lobbies[index].id!;
                    selectedLobbyNbPlayer = lobbies[index].nbPlayer;
                    lobby = lobbies[index];
                  })
                },
                child: Container(
                  color: (selectedValue == index) ? Colors.black26 : Colors.transparent,
                  child :ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(lobbies[index].id.toString()),

                        Text(lobbies[index].name),

                        Text("${lobbies[index].nbPlayer.toString()} / 15"),
                      ]
                    ),
                  )
                )
              );
            },
          );
        });
      } else {
        selectionsOfLobbies = ListView(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Il n'y a pas de lobby contenant ces lettres :(",
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 25,
                ),
              ),
            )

          ],
        );
      }
    } on Exception catch (e) {
      selectionsOfLobbies = ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              e.toString(),
              style: const TextStyle(
                color: Colors.black26,
                fontSize: 25,
              ),
            ),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    recupLobbies(nameLobby.text);
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
            "Rejoindre une partie",
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
            GestureDetector(
              onTap: () => {
                recupLobbies(nameLobby.text),
                setState(() {
                  selectedValue = -1;
                  selectedLobbyId = 0;
                })
              },
              child: Container(
                alignment: Alignment.center,
                width: 80,
                height: 40,
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black12,
                ),
                child: const Text(
                    "Recharger"
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(10),
              child :TextField(
                onTap: () => {
                  setState(() {
                    selectedValue = -1;
                    selectedLobbyId = 0;
                  })
                },
                controller: nameLobby,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Entrez ici le nom du lobby à rejoindre...",
                ),
              ),
            ),
            
            Container(
              width: 500,
              height: 400,
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
              color: Colors.black12,
              child: selectionsOfLobbies,
            ),

            GestureDetector(
                onTap: () {
                  if (selectedLobbyId != 0) {
                    if (selectedLobbyNbPlayer < 15) {
                      addPlayer(selectedLobbyId);
                      currentLobby = lobby!;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LobbyJoinedInterface(currentLobby: lobby!)
                          )
                      );
                    } else {
                      //Todo: print("trop de personne deja connecté à ce lobby");
                    }
                  } else {
                    //Todo: print("Aucun lobby n'a été saisi");
                  }
                },
                child:Container(
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
                    "Rejoindre",
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                )
            )
          ]
      ),
    );
  }
}