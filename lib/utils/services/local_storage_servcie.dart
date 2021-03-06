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

Future<void> storeClockInStatus(Map<String, List<bool>> status) async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.containsKey('clockInData')) {
    prefs.remove("clockInData");
  }

  final clockInData = json.encode(status);
  prefs.setString('clockInData', clockInData);
}

Future<Map<String, List<dynamic>>> getClockInStatus(String date) async {
  final prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey('clockInData')) {
    return null;
  }

  final extractedData = json.decode(prefs.getString('clockInData'));

  final formatData = new Map<String, List<dynamic>>.from(extractedData);

  return formatData;
}
