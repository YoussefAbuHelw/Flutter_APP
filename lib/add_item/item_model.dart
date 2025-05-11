import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sectiontasks/add_item/item.dart';

class ItemModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

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

  List<File> allImages(List<Item> items) {
    List<File> result = [];
    for (var item in items) {
      for (var image in item.images) {
        result.add(image);
      }
    }
    // notifyListeners();
    return result;
  }
}
