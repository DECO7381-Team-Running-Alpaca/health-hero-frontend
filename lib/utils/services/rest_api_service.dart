import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/api_path.dart' as URL;

// user login
Future<Map<String, String>> authLogin(Map<String, String> loginData) async {
  var body = json.encode({
    "user_name": loginData['username'],
    "password": loginData['password'],
  });

  try {
    final response = await http.post(
      Uri.parse(URL.login),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    final rawResponse = json.decode(response.body);

    // store the user auth Data
    // Backend haven't been modified 26/9
    Map<String, String> userData = {
      'userId': rawResponse['user']['_id'],
      'token': rawResponse['user']['tokens'].last['token'],
      'message': rawResponse['message'],
    };
    return userData;
  } catch (error) {
    throw error;
  }
}

// user signup
Future<Map<String, String>> authSignup(Map<String, String> signupData) async {
  var body = json.encode({
    "user_name": signupData['username'],
    "password": signupData['password'],
    "email": "testf@test.com",
    "weight": signupData['weight'],
    "height": signupData['height'],
  });

  try {
    final response = await http.post(
      Uri.parse(URL.signup),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    final rawResponse = json.decode(response.body);

    Map<String, String> userData = {
      'userId': rawResponse['data']['id'],
      'token': rawResponse['data']['token'],
      'message': rawResponse['message'],
    };
    return userData;
  } catch (error) {
    throw error;
  }
}
