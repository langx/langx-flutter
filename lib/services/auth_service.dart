import 'package:flutter/material.dart';

// Service Imports
import 'package:langx_flutter/services/api_service.dart';

// Page Imports
import 'package:langx_flutter/pages/home/home.dart';
import 'package:langx_flutter/pages/login/login.dart';

Future<bool> isLoggedIn() async {
  try {
    await account.get();
    return true;
  } catch (e) {
    debugPrint('Error checking login status: $e');
    return false;
  }
}

Future<void> loginService({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  try {
    await account.createEmailPasswordSession(email: email, password: password);
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  } catch (e) {
    debugPrint('Login error: $e');
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.toString()}')),
      );
    }
  }
}

Future<void> logoutService({required BuildContext context}) async {
  try {
    await account.deleteSession(sessionId: 'current');
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  } catch (e) {
    debugPrint('Logout error: $e');
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: ${e.toString()}')),
      );
    }
  }
}

Future<void> oAuthLoginService({
  required provider,
  required BuildContext context,
}) async {
  try {
    await account.createOAuth2Session(provider: provider);
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  } catch (e) {
    debugPrint('OAuth login error: $e');
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OAuth login failed: ${e.toString()}')),
      );
    }
  }
}
