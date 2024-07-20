import 'package:flutter/material.dart';
import 'package:amuirl_client/amuirl_client.dart';
import 'package:amuirl_flutter/Pages/Widget/join_game.dart';
import 'package:amuirl_flutter/Pages/Widget/lobby_joined_interface.dart';
import 'package:amuirl_flutter/Pages/Widget/lobby_name.dart';
import 'package:amuirl_flutter/Pages/Widget/main_menu.dart';
import 'package:amuirl_flutter/Pages/Widget/profile.dart';
import 'package:amuirl_flutter/Pages/Widget/settings.dart';
import 'package:amuirl_flutter/Pages/Widget/user_connexion.dart';
import 'package:flutter/services.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
