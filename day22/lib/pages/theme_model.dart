import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool _darkModel = false;

  void toggleDarkModel() {
    _darkModel = !_darkModel;
    notifyListeners();
  }

  void updateDarkModel(bool value) {
    _darkModel = value;
    notifyListeners();
  }

  get isDarkModel => _darkModel;
}
