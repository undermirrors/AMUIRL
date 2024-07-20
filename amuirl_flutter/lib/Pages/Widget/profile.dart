import 'package:amuirl_flutter/main.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: const Alignment(-0.125, 0),
          child: const Text(
            "Profil",
            style: TextStyle(
              fontSize: 36,
            ),
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 75,
              width: 300,
              margin: const EdgeInsets.all(10.0),
              child: Text(
                "Pseudo : ${currentUser?.name}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                currentUser = null;
                Navigator.pushNamed(context, '/user_connexion');
              },
              child: Container(
                alignment: Alignment.center,
                height: 75,
                width: 300,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1,
                    )
                ),
                child: const Text(
                  "Se deconnecter",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}