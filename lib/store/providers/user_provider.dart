import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langx_flutter/store/notifiers/user_notifier.dart';

final userProvider = StateNotifierProvider<UserNotifier, List<dynamic>>((ref) {
  return UserNotifier();
});
