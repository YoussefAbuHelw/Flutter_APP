import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/add_item/item.dart';
import 'package:sectiontasks/add_item/item_model.dart';

class AddItemScreen extends StatefulWidget {
  AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
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
          child: Consumer<ItemModel>(
            builder:
                (BuildContext context, items, Widget? child) => ListView(
                  children: [
                    SizedBox(height: 30),

                    items.selectedImages!.isEmpty
                        ? Container(
                          color: Colors.grey,
                          height: 150,
                          width: MediaQuery.sizeOf(context).width - 20,
                          child: IconButton(
                            onPressed: () {
                              items.imageSelector();
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
                                  items.imageSelector();
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
                                    items.selectedImages!
                                        .map(
                                          (toElement) => Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                  items.removeImage(
                                                    items.selectedImages!
                                                        .indexOf(toElement),
                                                  );
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
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ), // Label color
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
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ), // Label color
                        ),
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).pushNamed('dashboard');
      //
      //     final item = Provider.of<ItemModel>(context, listen: false);
      //     item.addItem(
      //       Item(
      //         images: List.from(item.selectedImages!),
      //         title: title.text,
      //         body: body.text,
      //         isFavorite: false,
      //       ),
      //     );
      //     item.selectedImages!.clear();
      //
      //   },
      //   child: Icon(Icons.save),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final item = Provider.of<ItemModel>(context, listen: false);

          // Check if images are selected
          if (item.selectedImages == null || item.selectedImages!.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please select at least one image')),
            );
            return;
          }

          // Proceed to add item
          item.addItem(
            Item(
              images: List.from(item.selectedImages!),
              title: title.text,
              body: body.text,
              isFavorite: false,
            ),
          );

          item.selectedImages!.clear();
          Navigator.of(context).pushNamed('dashboard');
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
