// import 'package:flutter/cupertino.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:langx_flutter/pages/home/community.dart';
import 'package:langx_flutter/pages/home/profile.dart';

// Variables
int index = 1;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// Pages selection
class _HomeState extends State<Home> {
  final List<Widget> _bodyElements = [
    const Text("Chat Page"),
    const Community(),
    const Profile(),
  ];

// Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyElements.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          )
        ],

        // Index Handling
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
