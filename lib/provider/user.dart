import 'package:flutter/material.dart';

import '../utils/services/rest_api_service.dart';

class User with ChangeNotifier {
  final String authToken;
  final String userId;
  String _userName;
  String _email;
  String _height;
  String _weight;
  List<String> _preferences = [];
  List<String> _allergies = [];

  User(this.authToken, this.userId, this._userName);

  String get userName {
    return _userName;
  }

  Map<String, String> get extraDetail {
    return {
      'email': _email,
      'height': _height,
      'weight': _weight,
    };
  }

  Future<void> getUserProfile() async {
    try {
      await fetchCurrentUser().then((userData) {
        _userName = userData['userName'];
        _email = userData['email'];
        _height = userData['height'];
        _weight = userData['weight'];
      });

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  // Bug exists here
  Future<String> modfiyUserProfile(String info, String value) async {
    try {
      await updateCurrentUser(info, value).then((updateInfo) {
        String message;
        switch (info) {
          case "password":
            {
              message = "Password Update Successfully.";
            }
            break;
          default:
            {
              message = '$info update fail';
            }
        }
        return message;
      });

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addPrefs(List<String> prefs) async {
    try {
      await addUserAttribute(prefs, 'preferences').then((data) {
        // change the dynamic type to String
        for (var i = 0; i < data.length; i++) {
          _preferences.add(data[i] as String);
        }
        print(_preferences);
      });

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

    Future<void> addAllg(List<String> allg) async {
    try {
      await addUserAttribute(allg, 'allergies').then((data) {
        // change the dynamic type to String
        for (var i = 0; i < data.length; i++) {
          _allergies.add(data[i] as String);
        }
        print(_allergies);
      });

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
