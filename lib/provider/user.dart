import 'package:flutter/material.dart';
import 'package:health_hero/utils/services/rest_api_service.dart';

import '../utils/services/local_storage_servcie.dart';

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
}
