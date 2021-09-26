import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  // To be handled with expire date
  // DateTime _expireDate;
  String _userId;
  Timer _countTime;
  String _message;

  String get message {
    return _message;
  }

  Future<void> login(String account, String password) async {
    final url = 'http://whispering-plateau-82869.herokuapp.com/users/login';

    var body = json.encode({
      "user_name": account,
      "password": password,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      final responseData = json.decode(response.body);

      // need error handling
      _message = responseData['message'];
      // store the user auth Data
      // Backend haven't been modified 26/9
      _token = responseData['user']['tokens'].last['token'];
      _userId = responseData['user']['_id'];

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
