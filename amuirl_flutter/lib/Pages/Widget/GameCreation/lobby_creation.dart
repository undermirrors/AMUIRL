import 'package:amuirl_flutter/Pages/Utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_settings.dart';

class LobbyCreation extends StatefulWidget {
  const LobbyCreation({super.key});

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
          create: (context) => CreationPageChangeProvider(widget: const GameSettings()),
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