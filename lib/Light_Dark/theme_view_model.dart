import 'package:flutter/material.dart';
import 'theme_model.dart';

class ThemeViewModel extends ChangeNotifier {
  final ThemeModel _model;
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeViewModel(this._model) {
    _loadTheme();
  }

  void _loadTheme() async {
    _isDarkMode = await _model.loadTheme();
    notifyListeners();
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    _model.saveTheme(value);
    notifyListeners();
  }
}
