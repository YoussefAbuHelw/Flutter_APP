import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Sign_up/user.dart';

class SharedPrefsService extends ChangeNotifier {
  static const _isLoggedInKey = 'is_logged_in';
  static const _nameKey = 'user_name';
  static const _emailKey = 'user_email';
  static const _passwordKey = 'user_password';

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, user.name);
    await prefs.setString(_emailKey, user.email);
    await prefs.setString(_passwordKey, user.password);
    await prefs.setBool(_isLoggedInKey, true);
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_nameKey);
    final email = prefs.getString(_emailKey);
    final password = prefs.getString(_passwordKey);

    if (name != null && email != null && password != null) {
      notifyListeners();
      return User(name: name, email: email, password: password);
    }
    notifyListeners();
    return null;
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_nameKey);
    await prefs.remove(_isLoggedInKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_passwordKey);
  }

  //

  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', value);
  }



  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  SharedPrefsService() {
    _loadThemeFromPrefs();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _saveThemeToPrefs();
    notifyListeners();
  }

  void _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  void _saveThemeToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }
}
