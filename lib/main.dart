import 'package:flutter/material.dart';
import 'package:langx_flutter/login.dart';
// import 'package:langx_flutter/old/community.dart';
// import 'package:langx_flutter/pages/home/profile.dart';
// import 'package:langx_flutter/pages/home/profile.dart';
// import 'package:langx_flutter/pages/home/home.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const LoginScreen(),
      // home: const Home(),
    );
  }
}
