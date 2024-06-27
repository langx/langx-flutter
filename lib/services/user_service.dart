import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Service Imports
import 'package:langx_flutter/services/api_service.dart';

listUsers() async {
  try {
    await listDocuments(dotenv.env['USERS_COLLECTION']!);
  } catch (e) {
    debugPrint(e.toString());
  }
}
