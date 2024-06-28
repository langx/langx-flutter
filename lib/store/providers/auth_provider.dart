import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langx_flutter/store/notifiers/auth_notifier.dart';

// Define a provider for the AuthNotifier
final authProvider = StateNotifierProvider<AuthNotifier, AuthStatus>((ref) {
  return AuthNotifier();
});
