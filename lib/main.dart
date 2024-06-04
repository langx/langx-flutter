import 'package:langx_flutter/login.dart';
import 'package:flutter/material.dart';
import 'package:langx_flutter/home/community.dart';
import 'package:langx_flutter/home/profile.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const Community();
  }
}
