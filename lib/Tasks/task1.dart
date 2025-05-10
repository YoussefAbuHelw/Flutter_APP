import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sectiontasks/Profile/Models/user_model.dart';
import 'package:sectiontasks/Profile/Profile_page/profile_page.dart';
import 'package:sectiontasks/Profile/another_Profile/complete_profile.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/add_item/add_item_screen.dart';

class Task1 extends StatelessWidget {
  final String title;
  final String body;
  final List<File>? images;

  const Task1({
    this.images,
    required this.title,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var profileImage = Provider.of<UserModel>(context).user?.file;
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
          title,
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
            images!.isEmpty && images != null
                ? Image.asset(
                  "assets/images/tree.jpg",
                  height: 400,
                  width: MediaQuery.sizeOf(context).width - 20,
                  fit: BoxFit.cover,
                )
                : Image.file(
                  images![0],
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
              child: Text(textAlign: TextAlign.justify, body),
            ),
            images!.isEmpty && images != null
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
                          images![index],
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                    itemCount: images!.length,
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
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AddItemScreen()),
          );
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

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        isFavorite = !isFavorite;
        setState(() {});
      },
      icon: Icon(Icons.favorite, color: isFavorite ? Colors.red : Colors.grey),
    );
  }
}
