import 'package:flutter/foundation.dart';

class UserProfileModel extends ChangeNotifier {
  String name = '';
  String email = '';
  String phoneNumber = '';
  String gender = '';

  void updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
    required String gender,
  }) {
    this.name = name;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.gender = gender;
    notifyListeners();
  }
}
