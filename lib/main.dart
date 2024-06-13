import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:langx_flutter/pages/login/login.dart';
import 'package:langx_flutter/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: whiteTheme(),
      darkTheme: darkTheme(),
      home: const LoginScreen(),
      // home: const Home(),
    );
  }
}
