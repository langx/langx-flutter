import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:langx_flutter/appwrite.dart';

Account account = Account(client);

Future<bool> checkLoggedInUser() async{
  try {
    await account.get();
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}


logUserIn({email, password, context}) async{
  try {
    await account.createEmailPasswordSession(
      email: email, 
      password: password
      );
  } catch (e) {
    debugPrint(e.toString());
  }
}