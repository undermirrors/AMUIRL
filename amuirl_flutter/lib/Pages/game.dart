import 'package:amuirl_client/amuirl_client.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  Lobby currentLobby;
  Game({super.key, required this.currentLobby});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: const Alignment(-0.17, 0.0),
          child: const Text("Game"),
        ),
      ),
    );
  }

}