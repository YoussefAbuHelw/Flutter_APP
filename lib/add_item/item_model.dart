import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ItemModel extends ChangeNotifier {
  String? title;
  String? body;

  ImagePicker picker = ImagePicker();

  List<File>? selectedImages = [];

  Future<void> imageSelector() async {
    List<XFile> images = await picker.pickMultiImage();
    selectedImages!.addAll(images.map((image) => File(image.path)).toList());
    notifyListeners();
  }

  void removeImage(int index) {
    selectedImages!.removeAt(index);
    notifyListeners();
  }
}
