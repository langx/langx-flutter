import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Service Imports
import 'package:langx_flutter/services/auth_service.dart';

// Page Imports
import 'package:langx_flutter/pages/home/home.dart';
import 'package:langx_flutter/pages/login/login.dart';

// Define an enum for authentication state
enum AuthStatus { authenticated, unauthenticated, loading, error }

// Define a state notifier for authentication
class AuthNotifier extends StateNotifier<AuthStatus> {
  AuthNotifier() : super(AuthStatus.loading) {
    checkAuthStatus();
  }

  @override
  set state(AuthStatus value) {
    super.state = value;
    debugPrint('Auth status changed to: $value');
  }

  Future<void> checkAuthStatus() async {
    final isAuthenticated = await isLoggedIn();
    if (isAuthenticated) {
      state = AuthStatus.authenticated;
    } else {
      state = AuthStatus.unauthenticated;
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = AuthStatus.loading;
    try {
      await loginService(email: email, password: password);
      state = AuthStatus.authenticated;
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    } catch (e) {
      state = AuthStatus.error;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> oAuthLogin({
    required provider,
    required BuildContext context,
  }) async {
    state = AuthStatus.loading;
    try {
      await oAuthLoginService(provider: provider);
      state = AuthStatus.authenticated;
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    } catch (e) {
      state = AuthStatus.error;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OAuth login failed: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> logout(BuildContext context) async {
    state = AuthStatus.loading;
    try {
      await logoutService();
      state = AuthStatus.unauthenticated;
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    } catch (e) {
      state = AuthStatus.error;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout failed: ${e.toString()}')),
        );
      }
    }
  }
}
