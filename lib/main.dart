import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Theme Imports
import 'package:langx_flutter/theme.dart';

// Service Imports
import 'package:langx_flutter/services/auth_service.dart';

// Page Imports
import 'package:langx_flutter/pages/login/login.dart';
import 'package:langx_flutter/pages/home/home.dart';

void main() async {
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
      home: FutureBuilder<bool>(
        future: isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              return const Home();
            } else {
              return const LoginScreen();
            }
          } else {
            // TODO: #25 Implement Splash Screen
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
