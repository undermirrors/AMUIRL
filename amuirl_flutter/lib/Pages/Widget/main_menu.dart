import 'dart:io';
import 'package:flutter/material.dart';

import '../../main.dart';

void resetUser() {
  client.users.exitLobby(currentUser!.name);
}

class MainMenu extends StatefulWidget {

  const MainMenu({super.key});
  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static const Color colorButton = Colors.grey;
  static const Color textColorButton = Colors.white;
  static const double fontSizeButton = 25;
  final double widthButton = 200;

  @override
  Widget build(BuildContext context) {
    resetUser();
    currentLobby = null;

    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
              width: 135,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                  image: DecorationImage(
                    image: img,
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text("P R O F I L"),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              )
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              child: ListTile(
                leading: const Icon(Icons.gps_fixed_sharp),
                title: const Text("L O C A L I S A T I O N"),
                onTap: () {
                  // TODO
                },
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              child: ListTile(
                leading: const Icon(Icons.supervised_user_circle_rounded),
                title: const Text("A   P R O P O S   D E   N O U S"),
                onTap: () {
                  // TODO
                },
              ),
            ),
          ],
        )
      ),


      body: Stack(
        alignment: Alignment.center,
        children: [
           Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/PraiseTheSun.png'),
                    fit: BoxFit.cover,
                  )
              ),
            ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.topRight,
                        child: const Icon(
                          Icons.menu,
                          size: 50.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        alignment: Alignment.topRight,
                        child: const Icon(
                          Icons.settings,
                          size: 50.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ),

              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      radius: 0.3,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.elliptical(100, 60)),
                  ),
                  child: const Text(
                    "AMUIRL",
                    style: TextStyle(
                      color: textColorButton,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeButton * 2,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/lobby_name');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    alignment: Alignment.center,
                    width: widthButton,
                    decoration: const BoxDecoration(
                      color: colorButton,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Text(
                      "Créer une partie",
                      style: TextStyle(
                        color: textColorButton,
                        fontSize: fontSizeButton,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/join_game');
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 30.0),
                    alignment: Alignment.center,
                    width: widthButton,
                    decoration: const BoxDecoration(
                      color: colorButton,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Text(
                      "Rejoindre",
                      style: TextStyle(
                        color: textColorButton,
                        fontSize: fontSizeButton,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: GestureDetector(
                  onTap: () => exit(0),
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.bottomRight,
                    child: const Icon(
                      Icons.exit_to_app,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}