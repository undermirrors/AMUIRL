import 'package:amuirl_client/amuirl_client.dart';
import 'package:flutter/material.dart';

class GameInterface extends StatefulWidget {
  final Lobby currentLobby;
  GameInterface({super.key, required this.currentLobby});

  @override
  State<GameInterface> createState() => _GameInterfaceState();
}

class _GameInterfaceState extends State<GameInterface> {

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