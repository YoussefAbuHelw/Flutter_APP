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

  Item? _selectedItem;

  Item? get selectedItem => _selectedItem;

  void selectItem(Item item) {
    _selectedItem = item;
    notifyListeners();
  }
}
