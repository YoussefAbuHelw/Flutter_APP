import 'package:flutter/cupertino.dart';
import 'package:sectiontasks/add_item/item.dart';

class FavouriteModel extends ChangeNotifier {
  final List<Item> _favList = [];

  List<Item> get favList => _favList;

  void add(Item item) {
    if (!_favList.contains(item)) {
      _favList.add(item);
    }
    notifyListeners();
  }

  void remove(Item item) {
    if (_favList.contains(item)) {
      _favList.remove(item);
    }
    notifyListeners();
  }

  Item? _selectedItem;

  Item? get selectedItem => _selectedItem;

  void selectItem(Item item) {
    _selectedItem = item;
    notifyListeners();
  }

  void isFavorite(Item item) {
    item.isFavorite = !item.isFavorite;
    (item.isFavorite) ? favList.add(item) : favList.remove(item);
    notifyListeners();
  }
}
