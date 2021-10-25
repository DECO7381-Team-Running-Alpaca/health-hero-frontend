import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/services/rest_api_service.dart';
import '../utils/services/local_storage_servcie.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  String _message;
  String _userName;

  String get token {
    return _token;
  }

  String get message {
    return _message;
  }

  String get userId {
    return _userId;
  }

  String get userName {
    return _userName;
  }

  Future<void> login(Map<String, String> loginData) async {
    try {
      await authLogin(loginData).then((authData) {
        _message = authData['message'];
        _token = authData['token'];
        _userId = authData['userId'];
        _userName = loginData['username'];
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
        _userName = signupData['username'];
      }).catchError((e) {
        throw e;
      });
      notifyListeners();
      
      await storeUserLocally(_token, _userId);
    } catch (error) {
      throw error;
    }
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
