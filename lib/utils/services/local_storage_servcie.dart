import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeUserLocally(String token, String id) async {
  final prefs = await SharedPreferences.getInstance();
  final userData = json.encode({'token': token, 'useId': id});

  prefs.setString('userData', userData);
}

Future<String> getLocalUser() async {
  final prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey('userData')) {
    return 'No active user.';
  }

  final extractedData =
      json.decode(prefs.getString('userData')) as Map<String, Object>;
  return extractedData['token'];
}
