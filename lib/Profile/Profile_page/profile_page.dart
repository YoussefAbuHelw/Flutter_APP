import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sectiontasks/General_Widget/Card.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker picker = ImagePicker();

  File? selectedFile;

  Future<void> imageSelector(ImageSource source) async {
    XFile? image = await picker.pickImage(source: source);
    if (image != null && mounted) {
      setState(() {
        selectedFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 100,
                  child:
                      selectedFile == null
                          ? Icon(Icons.person, size: 200)
                          : ClipOval(
                            child: Image.file(
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                              selectedFile!,
                            ),
                          ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder:
                            (context) => SizedBox(
                              height: 150,
                              child: Column(
                                children: [
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                      // fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(),
                                  Expanded(
                                    // Added Expanded to take available space
                                    child: SingleChildScrollView(
                                      // Added scroll view
                                      scrollDirection: Axis.horizontal,
                                      // Set horizontal scroll
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Options(
                                            onPressed: () {
                                              imageSelector(ImageSource.camera);
                                              setState(() {
                                                Navigator.pop(context);
                                              });
                                            },
                                            icon: Icons.camera_alt,
                                            title: "camera",
                                          ),
                                          Options(
                                            onPressed: () {
                                              imageSelector(
                                                ImageSource.gallery,
                                              );
                                              setState(() {
                                                Navigator.pop(context);
                                              });
                                            },
                                            icon: Icons.image,
                                            title: "Gallery",
                                          ),
                                          if (selectedFile != null)
                                            Options(
                                              onPressed: () {
                                                if (mounted) {
                                                  setState(() {
                                                    selectedFile = null;
                                                    Navigator.pop(context);
                                                  });
                                                }
                                              },
                                              icon: Icons.delete,
                                              title: "delete",
                                              // selectedFile: selectedFile,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      );
                    },
                    icon: Icon(Icons.camera_alt, size: 30, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
          ContactCard(
            icon: Icons.person,
            iconColor: Colors.deepPurple,
            title: "Name",
            subtitle: "Youssef Mohamed",
          ),
          ContactCard(
            icon: Icons.info,
            iconColor: Colors.deepPurple,
            title: "Bio",
            subtitle: "busy",
          ),
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  const Options({
    required this.onPressed,
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 30,
              color: title == "delete" ? Colors.red : Colors.black,
              // color: selectedFile == null ? Colors.black : Colors.red,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: title == "delete" ? Colors.red : Colors.black,
              // color: selectedFile == null ? Colors.black : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
