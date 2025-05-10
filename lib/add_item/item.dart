import 'dart:io';

class Item {
  Item({
    required this.images,
    required this.title,
    required this.body,
    required this.isFavorite,
  });

  late File images;
  late String title;
  late String body;
  late bool isFavorite;
}
