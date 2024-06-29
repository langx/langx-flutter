import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Service Imports
import 'package:langx/services/auth_service.dart';

// Page Imports
import 'package:langx/pages/home/home.dart';
import 'package:langx/pages/login/login.dart';

// Define an enum for authentication state
enum AuthStatus { authenticated, unauthenticated, loading, error }

// Define a state notifier for authentication
class AuthNotifier extends StateNotifier<AuthStatus> {
  AuthNotifier() : super(AuthStatus.loading) {
    checkAuthStatus();
  }

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  void clearErrorMessage() {
    _errorMessage = null;
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
    _errorMessage = null; // Clear any previous error message
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
      state = AuthStatus.unauthenticated; // Revert to unauthenticated state
      _errorMessage = 'Login failed: ${e.toString()}';
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage!)),
        );
      }
    }
  }

  Future<void> oAuthLogin({
    required provider,
    required BuildContext context,
  }) async {
    state = AuthStatus.loading;
    _errorMessage = null; // Clear any previous error message
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
      state = AuthStatus.unauthenticated; // Revert to unauthenticated state
      _errorMessage = 'OAuth login failed: ${e.toString()}';
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage!)),
        );
      }
    }
  }

  Future<void> logout(BuildContext context) async {
    state = AuthStatus.loading;
    _errorMessage = null; // Clear any previous error message
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
      _errorMessage = 'Logout failed: ${e.toString()}';
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage!)),
        );
      }
    }
  }
}

// Define a provider for the AuthNotifier
final authProvider = StateNotifierProvider<AuthNotifier, AuthStatus>((ref) {
  return AuthNotifier();
});
