import 'package:amuirl_client/amuirl_client.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'lobby_value_basics.dart';

class LobbyJoinedInterface extends StatefulWidget {
  const LobbyJoinedInterface({super.key});

  @override
  State<LobbyJoinedInterface> createState() => _LobbyJoinedInterfaceState();
}

class _LobbyJoinedInterfaceState extends State<LobbyJoinedInterface> {

  static const EdgeInsets marginButton = EdgeInsets.all(5.0);
  static const double lengthBoutton = 75;
  List<String>? players;
  Lobby? currentLobby;
  List<int> valueParam = <int>[1, 120, 2, 1, 150, 5, 10];

  void disconnectPlayer() async {
    Lobby? lobby = await client.lobbies.getLobby(currentUser!.currentlobby);
    if (lobby != null) {
      var res = await client.lobbies.suppressPlayer(lobby.id!, currentUser!);
      // print(res);
    }
    Navigator.pop(context);
  }

  void getPlayerInfoclient() async {
    updateUser(context);
    var lobby = await client.lobbies.getLobby(currentUser!.currentlobby);
    if (lobby != null) {
      setState(() {
        players = lobby.players;
        currentLobby = lobby;
        valueParam = lobby.gameParameter;
      });
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser != null) {
      setState(() {
        getPlayerInfoclient();
      });
    } else {
      Navigator.pushNamed(context, '/user_connexion');
    }
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(
            children: [
              GestureDetector(
                onTap: () async => disconnectPlayer(),
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  alignment: Alignment.bottomLeft,
                  child: const Icon(
                    Icons.arrow_back,
                    size: 25.0,
                  ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                child: Text(
                  currentLobby != null ? currentLobby!.name : "",
                  style: const TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
            ],
          ),


          Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 2,
                  )
              ),
              height: 400,
              width: 500,
              child: ListView(
                children: [
                  for (int index = 0; index < LobbyValueBasics.nomParam.length; index++)
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: 300,
                        alignment: Alignment.center,
                        child: Text(
                          LobbyValueBasics.nomParam[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Container(
                        alignment: Alignment.center,
                        height: lengthBoutton,
                        margin: marginButton,
                        child: Text(
                          "${valueParam[index].toString()}${LobbyValueBasics.screenValues[index]}",
                          style: const TextStyle(
                            fontSize: 45,
                          )
                        ),
                      ),
                    ]
                  )
                ]
              )
          ),

          Container(
            width: 300,
            height: 300,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 150.0),
            color: Colors.black12,
            child: ListView.builder(
                itemCount: (players != null) ? players!.length : 0,
                itemBuilder: (context, index) => Container(
                  alignment: Alignment.center,
                  child: Text(
                    players![index],
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}