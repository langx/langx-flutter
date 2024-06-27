import 'package:flutter/foundation.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Client client = Client()
    .setEndpoint(dotenv.env['APP_ENDPOINT']!)
    .setProject(dotenv.env['APP_PROJECT']!);

Account account = Account(client);
Databases databases = Databases(client);
Functions functions = Functions(client);
Storage storage = Storage(client);
Locale locale = Locale(client);

Future<dynamic> listDocuments(String collectionId,
    {List<String>? queries}) async {
  try {
    final response = await databases.listDocuments(
      databaseId: dotenv.env['APP_DATABASE']!,
      collectionId: collectionId,
      queries: queries ?? [],
    );
    return response;
  } catch (e) {
    debugPrint('Error listing documents: $e');
    return null;
  }
}
