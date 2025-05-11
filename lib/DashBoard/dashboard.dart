import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/Profile/Models/user_model.dart';
import 'package:sectiontasks/Profile/Profile_page/profile_page.dart';
import 'package:sectiontasks/add_item/item.dart';
import 'package:sectiontasks/add_item/item_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.file;
    final items = Provider.of<ItemModel>(context);
    List<File> images = items.allImages(items.items);

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

              // itemCount: items.items.length,
              itemCount: images.length,
              itemBuilder: (context, index) {
                // final file = items.allImages(items.items)[index];

                return SingleChildScrollView(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'task1');
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Image.file(
                            images[index],
                            // items.items[index].images[index],
                            height: 200,
                            width: 200,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text(items.items[index].title),
                          //       IconButton(
                          //         onPressed: () {},
                          //         icon: Icon(Icons.favorite),
                          //       ),
                          //     ],
                          //   ),
                          // ),
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
    print(getLength(items.items));
  }

  int getLength(List<Item> items) {
    int length = 0;
    for (var item in items) {
      for (var image in item.images) {
        length++;
      }
    }
    return length;
  }

  List<File> imagesArray(List<Item> items) {
    List<File> imageFile = [];
    for (var image in items) {
      for (var i in image.images) {
        imageFile.add(i);
      }
    }
    return imageFile;
  }

  void printImage(List<Item> items) {
    print("length ya youssef: ${getLength(items)}");
  }
}
