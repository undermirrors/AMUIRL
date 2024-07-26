import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/Widget/lobby_waiting_moment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Utils/providers.dart';

class LobbyJoinedInterface extends StatefulWidget {
  final Lobby currentLobby;
  const LobbyJoinedInterface({super.key, required this.currentLobby});

  @override
  State<LobbyJoinedInterface> createState() => _LobbyJoinedInterfaceState();
}

class _LobbyJoinedInterfaceState extends State<LobbyJoinedInterface> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CreationPageChangeProvider(widget: LobbyWaitingMoment(currentLobby: widget.currentLobby)),
          ),

          ChangeNotifierProvider(
            create: (context) => GameProvider(),
          ),
        ],
        builder: (context, child) {
          return context.watch<CreationPageChangeProvider>().widget;
        }
    );
  }
}