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
    await Future.delayed(Duration(seconds: 2));

    bool loggedIn = await _prefsService.isLoggedIn();

    if (loggedIn) {
      User? user = await _prefsService.getUser();
      print(user?.name);
      print(user?.email);
      print(user?.password);
      if (user != null) {
        // Navigate to dashboard or home screen, passing user if needed
        Navigator.pushReplacementNamed(context, 'nav_bar');
      } else {
        // User data not found, treat as logged out
        Navigator.pushReplacementNamed(context, 'signup');
      }
    } else {
      // Not logged in
      Navigator.pushReplacementNamed(context, 'signup');
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
