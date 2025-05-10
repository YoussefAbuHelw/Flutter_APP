import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sectiontasks/Tasks/task1.dart';

class Task2 extends StatefulWidget {
  Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  ImagePicker picker = ImagePicker();

  List<File>? selectedImages = [];

  Future<void> imageSelector() async {
    List<XFile> images = await picker.pickMultiImage();
    if (images != null && mounted) {
      setState(() {
        selectedImages!.addAll(
          images.map((image) => File(image.path)).toList(),
        );
      });
    }
  }

  TextEditingController title = TextEditingController();

  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(backgroundColor: Colors.transparent),
      body: MergeSemantics(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/tree.jpg"),
              fit: BoxFit.fitWidth,
              // fit: BoxFit.fitHeight,
            ),
          ),
          child: ListView(
            children: [
              SizedBox(height: 30),

              selectedImages!.isEmpty
                  ? Container(
                    color: Colors.grey,
                    height: 150,
                    width: MediaQuery.sizeOf(context).width - 20,
                    child: IconButton(
                      onPressed: () {
                        imageSelector();
                      },
                      icon: Icon(Icons.camera_alt),
                    ),
                  )
                  : Row(
                    children: [
                      Container(
                        color: Colors.grey,
                        height: 100,
                        width: 100,
                        child: IconButton(
                          onPressed: () {
                            imageSelector();
                          },
                          icon: Icon(Icons.camera_alt),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: MediaQuery.sizeOf(context).width - 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:
                              selectedImages!
                                  .map(
                                    (toElement) => Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Image.file(
                                            toElement,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              selectedImages!.remove(toElement);
                                            });
                                          },
                                          icon: Icon(Icons.cancel),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                    ],
                  ),
              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    hintText: "Enter your username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      // Rounded corners
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ), // Custom border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ), // Border when not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ), // Border when focused
                    ),
                    labelText: 'title',
                    labelStyle: TextStyle(color: Colors.black), // Label color
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: body,
                  minLines: 3,
                  maxLines: 6,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      // Rounded corners
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ), // Custom border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ), // Border when not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ), // Border when focused
                    ),
                    labelText: 'body',
                    labelStyle: TextStyle(color: Colors.black), // Label color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => Task1(
                    title: title.text,
                    body: body.text,
                    images: selectedImages,
                  ),
            ),
          );
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
