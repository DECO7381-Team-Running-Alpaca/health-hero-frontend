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

  String get token {
    // To be fufilled with expiration date.
    return _token;
  }

  String get message {
    return _message;
  }

  String get userId {
    return _userId;
  }

  Future<void> login(Map<String, String> loginData) async {
    try {
      await authLogin(loginData).then((authData) {
        _message = authData['message'];
        _token = authData['token'];
        _userId = authData['userId'];
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
      await authSignup(signupData).then((authData) {
        _message = authData['message'];
        _token = authData['token'];
        _userId = authData['userId'];
      }).catchError((e) {
        throw e;
      });
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
