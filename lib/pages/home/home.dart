import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langx_flutter/old/community.dart';
import 'package:langx_flutter/pages/home/community.dart';


//Variables
int index = 1;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//Pages selection
class _HomeState extends State<Home> {
  final List<Widget> _bodyElements = 
   [
     Container(
      child: Text("Demo 0"),
    ),
    Container(
      child: const Community(),
    ),
    Container(
      child: Text("Section 2"),
    )
  ];

//Main widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyElements.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            )
        ],

        //index handling
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