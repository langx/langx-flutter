import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_service.dart';

import 'package:langx_flutter/dfault_framework/dfault_material/dfault_buttons.dart';
import 'package:langx_flutter/dfault_framework/dfault_material/dfault_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      child: Image.asset("assets/images/langx.png"),
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
                          logUserIn(
                              email: emailController.text,
                              password: passwordController.text,
                              context: context);
                        }),
                    const SizedBox(height: 8),
                    TextButton(
                      // onPressed: () {
                      //   register(emailController.text, passwordController.text,
                      //       nameController.text);
                      // },
                      onPressed: () {},
                      child: const Text('Not a member yet? SIGN UP'),
                    ),
                    TextButton(
                      onPressed: () {},
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
                          onPressed: () {},
                        ),
                        const SizedBox(width: 30),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/images/facebook_icon.svg',
                            width: 40,
                            height: 40,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 30),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/images/apple_icon.svg',
                            width: 40,
                            height: 40,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {},
                      child: const Text('SHOW INTRO'),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {},
                      child: const Text('logout'),
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
