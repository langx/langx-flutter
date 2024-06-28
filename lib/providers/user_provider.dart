import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langx_flutter/services/user_service.dart';

class UserNotifier extends StateNotifier<List<dynamic>> {
  UserNotifier() : super([]);

  Future<void> fetchUsers() async {
    try {
      final users = await listUsers();
      state = users;
    } catch (e) {
      state = [];
      debugPrint('Failed to fetch users: $e');
    }
  }
}

final userProvider = StateNotifierProvider<UserNotifier, List<dynamic>>((ref) {
  return UserNotifier();
});
