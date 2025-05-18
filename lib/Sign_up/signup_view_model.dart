import 'package:flutter/material.dart';
import 'package:sectiontasks/Sign_up/user.dart';

import '../login/shared_prefs_service.dart';

class SignUpViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  User user = User(name: '', email: '', password: '');

  final _prefsService = SharedPrefsService();

  String? errorMessage;

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<bool> submit(Function onSuccess) async {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      form.save();

      try {
        await _prefsService.saveUser(user); // Save user in SharedPreferences
        // await _prefsService.setLoggedIn(true); // Set login status true
        errorMessage = null;
        notifyListeners();
        return true;
      } catch (e) {
        errorMessage = 'Failed to save user';
        onSuccess();
        notifyListeners();
        return false;
      }
    } else {
      errorMessage = 'Enter the fields';
      onSuccess();
      notifyListeners();
      return false;
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:sectiontasks/Sign_up/user.dart';
//
// class SignUpViewModel extends ChangeNotifier {
//   final formKey = GlobalKey<FormState>();
//   User user = User(name: '', email: '', password: '');
//
//   String? validateName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Name is required';
//     }
//     if (value.trim().length < 3) {
//       return 'Name must be at least 3 characters';
//     }
//     return null;
//   }
//
//   String? validateEmail(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Email is required';
//     }
//     final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
//     if (!emailRegex.hasMatch(value.trim())) {
//       return 'Enter a valid email';
//     }
//     return null;
//   }
//
//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     }
//     if (value.length < 6) {
//       return 'Password must be at least 6 characters';
//     }
//     return null;
//   }
//
//   void submit(Function onSuccess) {
//     final form = formKey.currentState;
//     if (form != null && form.validate()) {
//       form.save();
//       onSuccess();
//     }
//   }
// }
