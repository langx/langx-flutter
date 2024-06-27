import 'package:flutter/material.dart';

// Service Imports
import 'package:langx_flutter/services/api_service.dart';

// Page Imports
import 'package:langx_flutter/pages/home/home.dart';

Future<bool> isLoggedIn() async {
  try {
    await account.get();
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

login({required email, required password, required context}) async {
  try {
    await account.createEmailPasswordSession(email: email, password: password);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
  } catch (e) {
    debugPrint(e.toString());
  }
}

logout({required context}) async {
  await account.deleteSession(sessionId: 'current');
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const Home()));
}

oAuthLogin({required provider, required context}) async {
  await account.createOAuth2Session(provider: provider);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const Home()));
}
