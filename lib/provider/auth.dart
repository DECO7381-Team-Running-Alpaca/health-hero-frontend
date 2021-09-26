import 'dart:async';
import 'package:flutter/material.dart';

import '../utils/services/rest_api_service.dart';
import '../utils/services/local_storage_servcie.dart';

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

  Future<void> login(Map<String, String> loginData) async {
    try {
      await authLogin(loginData).then((userData) {
        _message = userData['message'];
        _token = userData['token'];
        _userId = userData['userId'];
      }).catchError((e) {
        throw e;
      });
      notifyListeners();
      await storeUserLocally(_token, _userId);
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(Map<String, String> signupData) async {
    try {
      await authSignup(signupData).then((userData) {
        _message = userData['message'];
        _token = userData['token'];
        _userId = userData['userId'];
      }).catchError((e) {
        throw e;
      });
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
