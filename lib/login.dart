import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:langx_flutter/pages/home/head_bar.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeadAppBar(
        title: 'LangX',
        centerTile: false,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('LOGIN'),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
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
