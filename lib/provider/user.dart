import 'package:flutter/material.dart';

import '../utils/services/rest_api_service.dart';

class User with ChangeNotifier {
  final String authToken;
  final String userId;
  String _userName;
  String _email;
  String _height;
  String _weight;

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

  // Future<void> modfiyUserProfile() async {
  //   try {
  //     await updateCurrentUser().then((userData) {
  //       _userName = userData['userName'];
  //       _email = userData['email'];
  //       _height = userData['height'];
  //       _weight = userData['weight'];
  //     });

  //     notifyListeners();
  //   } catch (error) {
  //     throw error;
  //   }
  // }


}
