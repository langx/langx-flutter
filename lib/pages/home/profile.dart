import 'package:flutter/material.dart';
import 'package:langx_flutter/components/profile_user_card.dart';
import 'package:langx_flutter/components/profile_token_card.dart';

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
        title: const Text("Profile",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: false,
        backgroundColor: Colors.yellow[700],
      ),
      backgroundColor: const Color.fromARGB(31, 163, 163, 163),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: ListView(
          children:const [
             //Afterwards, it should be modified to take an ID as input and retrieve data based on that ID.
             //Alternatively, the outer layer retrieves all the data for the cards and inserts them individually.
             ProfileUserCard(
              name: 'Addison',
              age: 18,
              gender: 'Male',
              location: 'TW',
              imageUrl: 'assets/images/preview.png',
              status: 'Online',
            ),
            ProfileTokenCard()
          ],
        ),
      ),
    );
  }
}


