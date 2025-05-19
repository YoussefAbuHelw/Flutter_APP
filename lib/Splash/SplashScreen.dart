import 'package:flutter/material.dart';
import '../Sign_up/user.dart';

import '../login/shared_prefs_service.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPrefsService _prefsService = SharedPrefsService();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Optional: Add a short delay to show splash screen nicely
    await Future.delayed(Duration(seconds: 10));

    bool loggedIn = await _prefsService.isLoggedIn();

    if (loggedIn) {
      User? user = await _prefsService.getUser();

      if (user != null) {
        Navigator.pushReplacementNamed(context, 'nav_bar');
      } else {
        Navigator.pushReplacementNamed(context, 'welcome_screen');
      }
    } else {
      Navigator.pushReplacementNamed(context, 'welcome_screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to My App',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
