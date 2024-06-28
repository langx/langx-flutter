import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Service Imports
import 'package:langx_flutter/services/auth_service.dart';

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
      await loginService(
        email: email,
        password: password,
        context: context,
      );
      state = AuthStatus.authenticated;
    } catch (e) {
      state = AuthStatus.error;
    }
  }

  Future<void> logout(BuildContext context) async {
    state = AuthStatus.loading;
    try {
      await logoutService(context: context);
      state = AuthStatus.unauthenticated;
    } catch (e) {
      state = AuthStatus.error;
    }
  }

  Future<void> oAuthLogin({
    required String provider,
    required BuildContext context,
  }) async {
    state = AuthStatus.loading;
    try {
      await oAuthLoginService(
        provider: provider,
        context: context,
      );
      state = AuthStatus.authenticated;
    } catch (e) {
      state = AuthStatus.error;
    }
  }
}
