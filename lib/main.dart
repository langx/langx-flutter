import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

import 'package:langx_flutter/login.dart';
// import 'package:langx_flutter/old/community.dart';
// import 'package:langx_flutter/pages/home/profile.dart';
// import 'package:langx_flutter/pages/home/profile.dart';
// import 'package:langx_flutter/pages/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Client client =
      Client().setEndpoint("https://db.langx.io/v1").setProject("<PROJECT_ID>");
  Account account = Account(client);

  runApp(Main(
    home: const LoginScreen(),
    account: account,
  ));
}

class Main extends StatelessWidget {
  final Widget home;
  final Account account;

  // ignore: use_super_parameters
  const Main({Key? key, required this.home, required this.account})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: home,
      // home: const Home(),
    );
  }
}
