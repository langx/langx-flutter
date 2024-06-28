import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Service Imports
import 'package:langx_flutter/services/api_service.dart';

Future<List<dynamic>> listUsers() async {
  try {
    final response = await listDocuments(dotenv.env['USERS_COLLECTION']!,
        queries: [Query.orderDesc('\$updatedAt')]);
    return response.documents;
  } catch (e) {
    debugPrint('Error listing users: $e');
    rethrow;
  }
}
