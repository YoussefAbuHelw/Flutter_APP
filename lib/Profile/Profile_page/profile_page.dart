import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sectiontasks/General_Widget/Card.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/Profile/Models/user_model.dart';

import '../../Sign_up/user.dart';
import '../../login/shared_prefs_service.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

//
class _ProfilePageState extends State<ProfilePage> {
  final _prefsService = SharedPrefsService();
  User? loggInUser;

  @override
  void initState() {
    super.initState();
    fetchUser(); // ✅ Don't wrap in setState
  }

  void fetchUser() async {
    final user = await _prefsService.getUser();
    setState(() {
      loggInUser = user; // ✅ Assign and update state
    });
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
            child: Consumer<UserModel>(
              builder:
                  (context, userModel, child) => Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 100,
                        child:
                            userModel.user?.file == null
                                ? Icon(Icons.person, size: 200)
                                : ClipOval(
                                  child: Image.file(
                                    userModel.user!.file!,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
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
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Divider(),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Options(
                                                  onPressed: () {
                                                    userModel.imageSelector(
                                                      ImageSource.camera,
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icons.camera_alt,
                                                  title: "camera",
                                                ),
                                                Options(
                                                  onPressed: () {
                                                    userModel.imageSelector(
                                                      ImageSource.gallery,
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icons.image,
                                                  title: "Gallery",
                                                ),
                                                if (userModel.user?.file !=
                                                    null)
                                                  Options(
                                                    onPressed: () {
                                                      userModel.removeImage();
                                                      Navigator.pop(context);
                                                    },
                                                    icon: Icons.delete,
                                                    title: "delete",
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
                          icon: Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
          ContactCard(
            icon: Icons.person,
            iconColor: Colors.deepPurple,
            title: "Name",
            subtitle: loggInUser?.name ?? "No Name",
          ),
          ContactCard(
            icon: Icons.info,
            iconColor: Colors.deepPurple,
            title: "Email",
            subtitle: loggInUser?.email ?? "No Email",
          ),
        ],
      ),
    );
  }
}
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:sectiontasks/General_Widget/Card.dart';
// import 'package:provider/provider.dart';
// import 'package:sectiontasks/Profile/Models/user_model.dart';
//
// import '../../Sign_up/user.dart';
// import '../../login/shared_prefs_service.dart';
//
// class ProfilePage extends StatefulWidget {
//   ProfilePage({super.key});
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final _prefsService = SharedPrefsService();
//   User? loggInUser;
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       fetchUser();
//     });
//   }
//
//   void fetchUser() async {
//     loggInUser = await _prefsService.getUser();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final loggInUser = Provider.of<SharedPrefsService>(context, listen: true);
//     loggInUser.getUser();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile", style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.purple,
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: Consumer<UserModel>(
//               builder:
//                   (context, userModel, child) => Stack(
//                     alignment: Alignment.bottomRight,
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: Colors.grey,
//                         radius: 100,
//                         child:
//                             userModel.user?.file == null
//                                 ? Icon(Icons.person, size: 200)
//                                 : ClipOval(
//                                   child: Image.file(
//                                     width: 200,
//                                     height: 200,
//                                     fit: BoxFit.cover,
//                                     userModel.user!.file!,
//                                   ),
//                                 ),
//                       ),
//                       CircleAvatar(
//                         backgroundColor: Colors.black,
//                         radius: 25,
//                         child: IconButton(
//                           onPressed: () {
//                             showModalBottomSheet(
//                               context: context,
//                               builder:
//                                   (context) => SizedBox(
//                                     height: 150,
//                                     child: Column(
//                                       children: [
//                                         Text(
//                                           "Profile",
//                                           style: TextStyle(
//                                             // fontSize: 25,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Divider(),
//                                         Expanded(
//                                           // Added Expanded to take available space
//                                           child: SingleChildScrollView(
//                                             // Added scroll view
//                                             scrollDirection: Axis.horizontal,
//                                             // Set horizontal scroll
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               children: [
//                                                 Options(
//                                                   onPressed: () {
//                                                     userModel.imageSelector(
//                                                       ImageSource.camera,
//                                                     );
//                                                     setState(() {
//                                                       Navigator.pop(context);
//                                                     });
//                                                   },
//                                                   icon: Icons.camera_alt,
//                                                   title: "camera",
//                                                 ),
//                                                 Options(
//                                                   onPressed: () {
//                                                     userModel.imageSelector(
//                                                       ImageSource.gallery,
//                                                     );
//                                                     setState(() {
//                                                       Navigator.pop(context);
//                                                     });
//                                                   },
//                                                   icon: Icons.image,
//                                                   title: "Gallery",
//                                                 ),
//                                                 if (userModel.user?.file !=
//                                                     null)
//                                                   Options(
//                                                     onPressed: () {
//                                                       userModel.removeImage();
//                                                       Navigator.pop(context);
//                                                     },
//                                                     icon: Icons.delete,
//                                                     title: "delete",
//                                                     // selectedFile: selectedFile,
//                                                   ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                             );
//                           },
//                           icon: Icon(
//                             Icons.camera_alt,
//                             size: 30,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//             ),
//           ),
//           Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
//           ContactCard(
//             icon: Icons.person,
//             iconColor: Colors.deepPurple,
//             title: "Name",
//             subtitle: loggInUser?.name ?? "",
//           ),
//           ContactCard(
//             icon: Icons.info,
//             iconColor: Colors.deepPurple,
//             title: "Email",
//             subtitle: loggInUser?.email ?? "",
//           ),
//         ],
//       ),
//     );
//   }
// }

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
