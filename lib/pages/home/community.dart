import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(31, 163, 163, 163),
      appBar: AppBar(
        title: Text("Community"),
        backgroundColor: Color.fromARGB(255, 253, 237, 154),
      ),
      body: 
      Container(),
    );
  }
}