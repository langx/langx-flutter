import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:toastification/toastification.dart';

// Themes Import
import 'package:langx/theme.dart';

// Pages Import
import 'package:langx/pages/login/login.dart';
import 'package:langx/pages/home/home.dart';

// Providers Import
import 'package:langx/providers/auth_provider.dart';

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
                toastification.show(
                  context: context,
                  type: ToastificationType.error,
                  title: Text(authNotifier.errorMessage!),
                  autoCloseDuration: const Duration(seconds: 3),
                  alignment: Alignment.topCenter,
                );
                authNotifier.clearErrorMessage();
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
