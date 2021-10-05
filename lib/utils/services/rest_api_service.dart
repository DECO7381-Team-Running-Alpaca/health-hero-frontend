import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../services/local_storage_servcie.dart';
import '../../constants/api_path.dart' as URL;

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

    Map<String, String> authData = {
      'userId': rawResponse['data']['id'],
      'token': rawResponse['data']['token'],
      'message': rawResponse['message'],
    };
    return authData;
  } catch (error) {
    throw error;
  }
}

Future<Map<String, String>> fetchCurrentUser() async {
  try {
    final token = await getLocalUser();
    final response = await http.get(
      Uri.parse(URL.getUser),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ' + token,
      },
    );
    final rawResponse = json.decode(response.body);

    Map<String, String> userData = {
      'userName': rawResponse['data']['user_name'],
      'email': rawResponse['data']['email'],
      'height': rawResponse['data']['height'].toString(),
      'weight': rawResponse['data']['weight'].toString(),
    };
    return userData;
  } catch (error) {
    print(error);
    throw error;
  }
}

Future<Map<String, String>> updateCurrentUser(String info, String value) async {
  try {
    final token = await getLocalUser();
    var body = json.encode({info: value});

    final response = await http.patch(
      Uri.parse(URL.updateUser),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ' + token,
      },
      body: body,
    );
    final rawResponse = json.decode(response.body);

    Map<String, String> updateInfo = {
      info: rawResponse['data']['user'][info],
    };
    return updateInfo;
  } catch (error) {
    print(error);
    throw error;
  }
}
// add preferences

// add allergies