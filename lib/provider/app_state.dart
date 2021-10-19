import 'package:flutter/material.dart';
import 'package:health_hero/utils/helpers/date_handler.dart';

class AppState extends ChangeNotifier {
  int selectedCategoryId = int.parse(currentDate("normal"));
  
  void updateCategoryId(int selectedCategoryId) {
    this.selectedCategoryId = selectedCategoryId;
    notifyListeners();
  }
}
