import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:langx_flutter/store/notifiers/auth_notifier.dart';

// Themes Import
import 'package:langx_flutter/theme.dart';

// Pages Import
import 'package:langx_flutter/pages/login/login.dart';
import 'package:langx_flutter/pages/home/home.dart';

// Providers Import
import 'package:langx_flutter/store/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(
    const ProviderScope(
      child: Main(),
    ),
  );
}

class Main extends ConsumerWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    return MaterialApp(
      theme: whiteTheme(),
      darkTheme: darkTheme(),
      home: Scaffold(
        body: Builder(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (authNotifier.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(authNotifier.errorMessage!)),
                );
                authNotifier
                    .clearErrorMessage(); // Clear the error message after displaying it
              }
            });

            return authStatus == AuthStatus.loading
                ? const SplashScreen()
                : authStatus == AuthStatus.authenticated
                    ? const Home()
                    : const LoginScreen();
          },
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
