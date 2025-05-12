import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/Profile/Models/user_model.dart';
import 'package:sectiontasks/Profile/Profile_page/profile_page.dart';
import 'package:sectiontasks/add_item/item.dart';
import 'package:sectiontasks/add_item/item_model.dart';
import 'package:sectiontasks/favourite/favourite_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.file;
    final favItems = Provider.of<FavouriteModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                // MaterialPageRoute(
                //   builder: (context) => CompleteProfileScreen(),
                // ),
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon:
                (profileImage == null)
                    ? Icon(Icons.account_circle_sharp, color: Colors.black)
                    : CircleAvatar(
                      child: ClipOval(
                        child: Image.file(
                          profileImage,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
          ),
        ],
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Consumer<ItemModel>(
        builder:
            (BuildContext context, items, Widget? child) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
              ),

              // itemCount: images.length,
              itemCount: items.items.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: InkWell(
                    onTap: () {
                      items.selectItem(
                        Item(
                          images: items.items[index].images,
                          title: items.items[index].title,
                          body: items.items[index].body,
                          isFavorite: items.items[index].isFavorite,
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
                              items.items[index].images.first,
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
                                    items.items[index].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    favItems.isFavorite(items.items[index]);
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color:
                                        favItems.favList.contains(
                                              items.items[index],
                                            )
                                            ? Colors.red
                                            : Colors.grey.shade400,

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_item');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
