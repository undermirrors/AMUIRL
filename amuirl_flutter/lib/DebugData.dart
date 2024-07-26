import 'package:amuirl_client/amuirl_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

var cliente = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const Debugdata());
}

class Debugdata extends StatefulWidget {
  const Debugdata({super.key});

  @override
  State<Debugdata> createState() => _DebugdataState();
}

class _DebugdataState extends State<Debugdata> {
  ListView selectionsOfLobbies = ListView();
  ListView selectionOfPlayers = ListView();

  void recupLobbies() async {
    try {
      var lobbies = await cliente.lobbies.getAllLobby();

      if (lobbies.isNotEmpty) {
        setState(() {
          selectionsOfLobbies = ListView.builder(
            itemCount: lobbies.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.transparent,
                child : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(lobbies[index].id.toString()),

                        Text(lobbies[index].name),

                        Text("${lobbies[index].nbPlayer.toString()} / 15"),
                      ]
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(lobbies[index].players.toString()),
                        ]
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(lobbies[index].gameParameter.toString()),
                        ]
                    ),
                  ]
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
                "Il n'y a pas de lobby :(",
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
      print(e.toString());
    }
  }

  void recupPlayers() async {
    try {
      var players = await cliente.users.getAllUser();

      if (players.isNotEmpty) {
        setState(() {
          selectionsOfLobbies = ListView.builder(
            itemCount: players.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  color: Colors.transparent,
                  child :ListTile(
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(players[index].id.toString()),

                            Text(players[index].name),

                            Text(players[index].currentlobby.toString()),

                            Text(players[index].mdp),
                          ]
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(players[index].impostor.toString()),

                              Text(players[index].inLife.toString()),

                              Text(players[index].nbBuzzerLeft.toString()),
                            ]
                        ),
                      ]
                    ),
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
                "Il n'y a pas de joueurs :(",
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
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    recupLobbies();
    recupPlayers();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 300,
                width: 400,
                color: Colors.grey,
                margin: const EdgeInsets.all(10.0),
                child: selectionOfPlayers,
              ),

              Container(
                alignment: Alignment.center,
                height: 300,
                width: 400,
                color: Colors.grey,
                margin: const EdgeInsets.all(10.0),
                child: selectionsOfLobbies,
              ),

              GestureDetector(
                onTap: () => {
                  cliente.lobbies.deleteAllLobbies(),
                  cliente.users.deleteAllUsers()
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 400,
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.red[200],
                  child: const Text("Click here to suppress all the database"),
                ),
              ),
            ]
          )
        )
      )
    );
  }
}
