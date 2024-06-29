import 'package:appwrite/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providers Import
import 'package:langx_flutter/providers/auth_provider.dart';

// Component Imports
import 'package:langx_flutter/components/atomic/dfault_buttons.dart';
import 'package:langx_flutter/components/atomic/dfault_input.dart';
import 'package:langx_flutter/components/atomic/oauth_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;

    final authNotifier = ref.read(authProvider.notifier);

    // Invert the status bar color based on the platform brightness
    SystemUiOverlayStyle overlayStyle;
    if (platformBrightness == Brightness.dark) {
      overlayStyle = SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      );
    } else {
      overlayStyle = SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      );
    }

    SystemChrome.setSystemUIOverlayStyle(overlayStyle);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          constraints: const BoxConstraints(
                              maxWidth: 300, maxHeight: 300),
                          child: Image.asset(
                            platformBrightness == Brightness.dark
                                ? "assets/images/langx-white.png"
                                : "assets/images/langx-dark.png",
                          ),
                        ),
                        const SizedBox(height: 25),
                        dInput(
                          label: "Email",
                          controller: emailController,
                        ),
                        const SizedBox(height: 16),
                        dInput(
                          label: "Password",
                          controller: passwordController,
                          obscureText: true,
                        ),
                        const SizedBox(height: 35),
                        dButton(
                          text: "Login",
                          onPress: () async {
                            await authNotifier.login(
                              email: emailController.text,
                              password: passwordController.text,
                              context: context,
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OAuthButton(
                              assetPath: 'assets/images/discord_icon.svg',
                              onPressed: () async {
                                await authNotifier.oAuthLogin(
                                  provider: OAuthProvider.discord,
                                  context: context,
                                );
                              },
                            ),
                            const SizedBox(width: 30),
                            OAuthButton(
                              assetPath: 'assets/images/google_icon.svg',
                              onPressed: () async {
                                await authNotifier.oAuthLogin(
                                  provider: OAuthProvider.google,
                                  context: context,
                                );
                              },
                            ),
                            const SizedBox(width: 30),
                            OAuthButton(
                              assetPath: 'assets/images/facebook_icon.svg',
                              onPressed: () async {
                                await authNotifier.oAuthLogin(
                                  provider: OAuthProvider.facebook,
                                  context: context,
                                );
                              },
                            ),
                            const SizedBox(width: 30),
                            OAuthButton(
                              assetPath: 'assets/images/apple_icon.svg',
                              onPressed: () async {
                                await authNotifier.oAuthLogin(
                                  provider: OAuthProvider.apple,
                                  context: context,
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                  flex: 7,
                                  child: Text(
                                    'Not a member yet?',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: TextButton(
                                    onPressed: () {
                                      // Navigate to registration page
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                  flex: 7,
                                  child: Text(
                                    'Forgot password?',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: TextButton(
                                    onPressed: () {
                                      // Navigate to forgot password page
                                    },
                                    child: const Text(
                                      'Reset It',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Show introduction
                          },
                          child: const Text(
                            'Show Intro',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
