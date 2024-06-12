import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:langx_flutter/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  Client client = Client()
      .setEndpoint(dotenv.env['APP_ENDPOINT']!)
      .setProject(dotenv.env['APP_PROJECT']!);
  Account account = Account(client);

  runApp(Main(
    home: LoginScreen(account: account),
    account: account,
  ));
}

class Main extends StatelessWidget {
  final Widget home;
  final Account account;

  const Main({super.key, required this.home, required this.account});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: home,
    );
  }
}
