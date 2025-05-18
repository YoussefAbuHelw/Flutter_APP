import 'package:flutter/material.dart';
import 'package:sectiontasks/login/shared_prefs_service.dart';

import '../Sign_up/user.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _prefsService = SharedPrefsService();
  String? errorMessage;
  User? loggedInUser;

  Future<bool> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      errorMessage = 'Please fill in all fields';
      notifyListeners();
      return false;
    }


    var storedUser = await _prefsService.getUser();

    if (email == storedUser?.email && password == storedUser?.password) {
      loggedInUser = storedUser;
      // await _prefsService.saveUser(storedUser);
      await _prefsService.setLoggedIn(true);
      errorMessage = null;
      notifyListeners();
      return true;
    } else {
      errorMessage = 'Invalid email or password';
      notifyListeners();
      return false;
    }
  }

  Future<bool> checkLoginStatus() async {
    final isLoggedIn = await _prefsService.isLoggedIn();
    if (isLoggedIn) {
      loggedInUser = await _prefsService.getUser();
    }
    return isLoggedIn;
  }

  Future<void> logout() async {
    await _prefsService.logout();
    loggedInUser = null;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
