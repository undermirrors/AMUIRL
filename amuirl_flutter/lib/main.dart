import 'package:flutter/material.dart';
import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/join_game.dart';
import 'package:amuirl_flutter/Pages/lobby_joined_interface.dart';
import 'package:amuirl_flutter/Pages/lobby_name.dart';
import 'package:amuirl_flutter/Pages/main_menu.dart';
import 'package:amuirl_flutter/Pages/profile.dart';
import 'package:amuirl_flutter/Pages/settings.dart';
import 'package:amuirl_flutter/Pages/user_connexion.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

User? currentUser;

void updateUser(BuildContext context) async {
  if (currentUser != null) {
    currentUser = await client.users.getUser(currentUser!.name);
  } else {
    Navigator.pushNamed(context, '/user_connexion');
  }
}

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/join_game': (context) => const JoinGame(),
        '/lobby_joined_interface': (context) => const LobbyJoinedInterface(),
        '/lobby_name': (context) => const LobbyName(),
        '/main_menu': (context) => const MainMenu(),
        '/profile': (context) => const Profile(),
        '/settings': (context) => const Settings(),
        '/user_connexion': (context) => const UserConnexion(),
      },
      home: const UserConnexion(),
    );
  }
}
