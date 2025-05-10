import 'dart:io';
import 'package:flutter/material.dart';

import 'package:sectiontasks/task2.dart';
import 'package:sectiontasks/Profile/complete_profile.dart';

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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompleteProfileScreen(),
                ),
                // MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: Icon(Icons.account_circle_sharp, color: Colors.white),
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
              width: MediaQuery
                  .sizeOf(context)
                  .width - 20,
              fit: BoxFit.cover,
            )
                : Image.file(
              images![0],
              height: 400,
              width: MediaQuery
                  .sizeOf(context)
                  .width - 20,
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
                    (BuildContext context, int index) =>
                    Image.file(
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
            MaterialPageRoute(builder: (context) => Task2()),
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
