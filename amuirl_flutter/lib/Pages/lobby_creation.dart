import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LobbyCreation extends StatefulWidget {
  Lobby currentLobby;
  LobbyCreation({super.key, required this.currentLobby});

  @override
  State<LobbyCreation> createState() => _LobbyCreationState();
}

class _LobbyCreationState extends State<LobbyCreation> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MapProvider(),
        ),

        ChangeNotifierProvider(
          create: (context) => CreationPageChangeProvider(widget.currentLobby),
        )
      ],
      builder: (context, child) {
        return context.watch<CreationPageChangeProvider>().widget;
      }
    );
  }
}