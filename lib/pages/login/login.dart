import 'package:appwrite/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providers Import
import 'package:langx_flutter/store/providers/auth_provider.dart';

// Component Imports
import 'package:langx_flutter/components/dfault_framework/dfault_material/dfault_buttons.dart';
import 'package:langx_flutter/components/dfault_framework/dfault_material/dfault_input.dart';

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

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(55),
                      padding: const EdgeInsets.all(5),
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
                        await ref.read(authProvider.notifier).login(
                              email: emailController.text,
                              password: passwordController.text,
                              context: context,
                            );
                      },
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        // Navigate to registration page
                      },
                      child: const Text('Not a member yet? SIGN UP'),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        // Navigate to forgot password page
                      },
                      child: const Text('Forgot password?'),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/images/google_icon.svg',
                            width: 40,
                            height: 40,
                          ),
                          onPressed: () async {
                            await ref.read(authProvider.notifier).oAuthLogin(
                                  provider: OAuthProvider.google,
                                  context: context,
                                );
                          },
                        ),
                        const SizedBox(width: 30),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/images/facebook_icon.svg',
                            width: 40,
                            height: 40,
                          ),
                          onPressed: () async {
                            await ref.read(authProvider.notifier).oAuthLogin(
                                  provider: OAuthProvider.facebook,
                                  context: context,
                                );
                          },
                        ),
                        const SizedBox(width: 30),
                        IconButton(
                          icon: SvgPicture.asset('assets/images/apple_icon.svg',
                              width: 40, height: 40),
                          onPressed: () async {
                            await ref.read(authProvider.notifier).oAuthLogin(
                                  provider: OAuthProvider.apple,
                                  context: context,
                                );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        // Show introduction
                      },
                      child: const Text('SHOW INTRO'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
