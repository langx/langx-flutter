import 'package:flutter/material.dart';

// Service Imports
import 'package:langx_flutter/services/api_service.dart';

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
}) async {
  await account.createEmailPasswordSession(email: email, password: password);
}

Future<void> oAuthLoginService({
  required provider,
}) async {
  await account.createOAuth2Session(provider: provider);
}

Future<void> logoutService() async {
  await account.deleteSession(sessionId: 'current');
}
