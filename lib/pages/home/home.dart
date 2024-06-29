import 'package:flutter/material.dart';

// Pages Import
import 'package:langx/pages/home/community.dart';
import 'package:langx/pages/home/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// Pages selection
class _HomeState extends State<Home> {
  int index = 1;

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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
