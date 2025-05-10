import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sectiontasks/Profile/Models/user.dart';

class UserModel extends ChangeNotifier {
  ImagePicker picker = ImagePicker();

  User? _user;

  User? get user => _user;

  Future<void> imageSelector(ImageSource source) async {
    XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      if (_user != null) {
        _user?.file = File(image.path);
      } else {
        _user = User(file: File(image.path), name: 'You', bio: '100100');
      }

      notifyListeners();
    }
  }

  removeImage() {
    _user?.file = null;
    notifyListeners();
  }
}
