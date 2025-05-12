import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/add_item/item_model.dart';
import 'package:sectiontasks/favourite/favourite_model.dart';

class FavoriteWidget extends StatelessWidget {
  FavoriteWidget({super.key});


  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ItemModel>(context, listen: true);
    final favItems = Provider.of<FavouriteModel>(context, listen: false);
    return IconButton(
      onPressed: () {
        // favItems.isFavorite(item.selectedItem!);
      },
      icon: Icon(
        Icons.favorite,
        color: item.selectedItem!.isFavorite ? Colors.red : Colors.grey,
      ),
    );
  }
}
