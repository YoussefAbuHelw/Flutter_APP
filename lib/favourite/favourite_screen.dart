import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/add_item/item.dart';
import 'package:sectiontasks/favourite/favourite_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourite'), centerTitle: true),
      body: Consumer<FavouriteModel>(
        builder:
            (BuildContext context, favItems, Widget? child) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
              ),

              // itemCount: images.length,
              itemCount: favItems.favList.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: InkWell(
                    onTap: () {
                      favItems.selectItem(
                        Item(
                          images: favItems.favList[index].images,
                          title: favItems.favList[index].title,
                          body: favItems.favList[index].body,
                          isFavorite: favItems.favList[index].isFavorite,
                        ),
                      );
                      Navigator.pushNamed(context, 'details');
                    },
                    child: Card(
                      margin: EdgeInsets.all(8),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.file(
                              favItems.favList[index].images.first,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    favItems.favList[index].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    favItems.favList[index].isFavorite = false;
                                    favItems.remove(favItems.favList[index]);
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      ),
    );
  }
}
