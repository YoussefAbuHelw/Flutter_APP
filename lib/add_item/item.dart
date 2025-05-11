import 'dart:io';

class Item {
  Item({
    required this.images,
    required this.title,
    required this.body,
    required this.isFavorite,
  });

  List<File> images;
  String title;
  String body;
  bool isFavorite;
}
