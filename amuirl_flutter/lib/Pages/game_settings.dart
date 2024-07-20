import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/lobby_value_basics.dart';
import 'package:amuirl_flutter/Pages/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class GameSettings extends StatefulWidget {
  Lobby currentLobby;
  GameSettings({super.key, required this.currentLobby});

  @override
  State<GameSettings> createState() => _GameSettingsState();
}

class _GameSettingsState extends State<GameSettings> {
  static const EdgeInsets marginButton = EdgeInsets.all(15.0);
  static const double lengthBoutton = 75;
  List<String>? players;
  List<int> valueParam = <int>[1, 120, 2, 1, 150, 5, 10];
  int maxValue = LobbyValueBasics.maxValues[0];

  void getPlayerInfoclient() async {
    updateUser(context);
    if (currentUser != null) {
      var lobby = await client.lobbies.getLobby(widget.currentLobby.id!);
      if (lobby != null) {
        setState(() {
          players = lobby.players;
          widget.currentLobby = lobby;
          if (players != null) {
            switch (players!.length) {
              case < 3 :
                maxValue = 1;
                break;
              case >= 3 && < 10 :
                maxValue = 2;
                break;
              default:
                maxValue = LobbyValueBasics.maxValues[0];
            }
          } else {
            maxValue = 1;
          }
          if (valueParam[0] > maxValue) {
            valueParam[0] = maxValue;
          }

          client.lobbies.changeParameter(lobby, valueParam);
        });
      } else {
        print("error : lobby not found");
      }
    } else {
      Navigator.pushNamed(context, '/user_connexion');
    }
  }

  void incrementValue(index) {
    setState(() {
      valueParam[index] =
          valueParam[index] + LobbyValueBasics.multiplier[index];
    });
  }
  // function
  void increaseValue(int index) {
    if (index == 0) {
      if (valueParam[index] < maxValue) {
        incrementValue(index);
      }
    } else {
      if (valueParam[index] < LobbyValueBasics.maxValues[index]) {
        incrementValue(index);
      }
    }
  }

  void decreaseValue(int index) {
    if (valueParam[index] > LobbyValueBasics.minValues[index]) {
      setState(() {
        valueParam[index] = valueParam[index] - LobbyValueBasics.multiplier[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getPlayerInfoclient();
    });
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () =>
                        {
                          client.lobbies.deleteLobby(widget.currentLobby),
                          Navigator.pop(context)
                        },
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
                          widget.currentLobby.name,
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
                            for (int index = 0; index < LobbyValueBasics
                                .nomParam.length; index++)
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

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                            onTap: () {
                                              decreaseValue(index);
                                            },
                                            child: Container(
                                              height: lengthBoutton,
                                              width: lengthBoutton,
                                              margin: marginButton,
                                              child: const Icon(
                                                Icons.remove,
                                                size: 40,
                                              ),
                                            )
                                        ),

                                        Container(
                                          alignment: Alignment.center,
                                          height: lengthBoutton,
                                          margin: marginButton,
                                          child: Text(
                                              "${valueParam[index]
                                                  .toString()}${LobbyValueBasics
                                                  .screenValues[index]}",
                                              style: const TextStyle(
                                                fontSize: 45,
                                              )
                                          ),
                                        ),

                                        GestureDetector(
                                            onTap: () {
                                              increaseValue(index);
                                            },
                                            child: Container(
                                              height: lengthBoutton,
                                              width: lengthBoutton,
                                              margin: marginButton,
                                              child: const Icon(
                                                Icons.add,
                                                size: 40,
                                              ),
                                            )
                                        ),
                                      ],
                                    ),
                                  ]
                              )
                          ]
                      )
                  ),

                ]
            ),
          ),

          Text(
            "${(players != null) ? players!.length : 0} joueurs :",
            style: const TextStyle(
              fontSize: 28,
            ),
          ),

          Container(
            width: 250,
            height: 250,
            padding: const EdgeInsets.all(10.0),
            color: Colors.black12,
            child: ListView.builder(
              itemCount: (players != null) ? players!.length : 0,
              itemBuilder: (context, index) =>
                Container(
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

          GestureDetector(
            onTap: () {
              // if (players!.length > 4) {
              context.read<CreationPageChangeProvider>().changeToTaskSelector(lobby: widget.currentLobby);
              // } else {
              //  print ("Not enougth players");
              // }
            },
            child: Container(
              alignment: Alignment.center,
              margin: marginButton * 2,
              width: lengthBoutton * 4,
              height: lengthBoutton * 1.5,
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
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 4,
                ),
              ),
              child: const Text(
                  "Edition des tâches",
                  style: TextStyle(
                    fontSize: 30,
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}