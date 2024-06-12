import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;

import 'package:langx_flutter/dfault_framework/dfault_material/dfault_buttons.dart';
import 'package:langx_flutter/dfault_framework/dfault_material/dfault_input.dart';
// import 'package:langx_flutter/pages/home/head_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.account});

  final Account account;

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  models.User? loggedInUser;

  Future<void> login(String email, String password) async {
    try {
      await widget.account
          .createEmailPasswordSession(email: email, password: password);
      final user = await widget.account.get();
      setState(() {
        loggedInUser = user;
      });
    } catch (e) {
      // Handle error
      print('Login failed: $e');
    }
  }

  Future<void> register(String email, String password, String name) async {
    try {
      await widget.account.create(
          userId: ID.unique(), email: email, password: password, name: name);
      await login(email, password);
    } catch (e) {
      // Handle error
      print('Registration failed: $e');
    }
  }

  Future<void> logout() async {
    try {
      await widget.account.deleteSession(sessionId: 'current');
      setState(() {
        loggedInUser = null;
      });
    } catch (e) {
      // Handle error
      print('Logout failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
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
                    dButtonFilled(
                      text: "Login",
                      onPressed: () {
                        login(emailController.text, passwordController.text);
                      },
                    ),
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
