import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sectiontasks/Profile/Models/user_model.dart';
import 'package:sectiontasks/Profile/Profile_page/profile_page.dart';
import 'package:sectiontasks/Profile/another_Profile/complete_profile.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/add_item/add_item_screen.dart';
import 'package:sectiontasks/add_item/item_model.dart';
import 'package:sectiontasks/favourite/favourite_model.dart';
import 'package:sectiontasks/items_datails/favourite_widget.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String body;
  final List<File>? images;

  const DetailsScreen({
    this.images,
    required this.title,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.file;
    final item = Provider.of<ItemModel>(context);
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
                    ? Icon(Icons.account_circle_sharp, color: Colors.white)
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
        title: Text(
          item.selectedItem!.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            item.selectedItem!.images.isEmpty &&
                    item.selectedItem!.images != null
                ? Image.asset(
                  "assets/images/tree.jpg",
                  height: 400,
                  width: MediaQuery.sizeOf(context).width - 20,
                  fit: BoxFit.cover,
                )
                : Image.file(
                  item.selectedItem!.images.first,
                  height: 400,
                  width: MediaQuery.sizeOf(context).width - 20,
                  fit: BoxFit.cover,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavoriteWidget(),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                textAlign: TextAlign.justify,
                item.selectedItem!.body,
              ),
            ),
            item.selectedItem!.images.isEmpty &&
                    item.selectedItem!.images != null
                ? Row(
                  children: [
                    MySeason(url: "assets/images/tree.jpg", text: "Spring"),
                    MySeason(url: "assets/images/tree.jpg", text: "Autumn"),
                  ],
                )
                : SizedBox(
                  height: 500,
                  child: GridView.builder(
                    itemBuilder:
                        (BuildContext context, int index) => Image.file(
                          item.selectedItem!.images[index],
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                    itemCount: item.selectedItem!.images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                  ),
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => AddItemScreen()),
          // );
        },
        child: Icon(Icons.next_plan),
      ),
    );
  }
}

class MySeason extends StatelessWidget {
  final String url;
  final String text;

  const MySeason({required this.url, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(width: 150, height: 150, fit: BoxFit.cover, url),
          Text(
            text,
            style: TextStyle(
              color: Colors.green,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
