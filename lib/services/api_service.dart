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
