import 'package:amuirl_client/amuirl_client.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class UserConnexion extends StatefulWidget {
  const UserConnexion({super.key});

  @override
  State<UserConnexion> createState() => _UserConnexionState();
}

class _UserConnexionState extends State<UserConnexion> {
  bool isConnexion = true;
  final TextEditingController username = TextEditingController();
  final TextEditingController mdp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isConnexion = true;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 100,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isConnexion ? Colors.grey : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.0),
                      border: (isConnexion)
                          ? Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2,
                      )
                          : null,
                    ),
                    child: const Text("Se connecter"),
                  ),
                ),

                Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  child: const Text("ou"),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      isConnexion = false;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 100,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isConnexion ? Colors.grey[300] : Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                      border: (!isConnexion)
                        ? Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2,
                        )
                        : null,
                    ),
                    child: const Text("S'inscrire"),
                  ),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 400,
                  height: 50,
                  child: TextField(
                    controller: username,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "nom d'utilisateur",
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 400,
                  height: 50,
                  child: TextField(
                    controller: mdp,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "mot de passe",
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                    if (isConnexion) {
                      var connexion = await client.users.getUser(username.text);
                      if (connexion != null) {
                        if (connexion.mdp == mdp.text) {
                          currentUser = connexion;
                          Navigator.pushNamed(context, '/main_menu');
                        } else {
                          print("invalid user mdp");
                        }
                      } else {
                        print("invalid username");
                      }
                    } else {
                      bool existingUser = await client.users.isExistingUser(username.text);
                      if (!existingUser) {
                        var newUser = User(
                          name: username.text,
                          mdp: mdp.text,
                          currentlobby: 0,
                          impostor: false,
                          inLife: true,
                        );
                        await client.users.createUser(newUser);
                        currentUser = newUser;
                        Navigator.pushNamed(context, '/main_menu');
                      } else {
                        print("user exist in database");
                      }
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 200,
                    height: 75,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2,
                      )
                    ),
                    child: Text(
                      (isConnexion) ? "Connexion" : "Inscription",
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      )
    );
  }

}
