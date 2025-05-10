import 'package:flutter/material.dart';
import 'package:sectiontasks/Portfolio/ContactScreen.dart';
import 'package:sectiontasks/Portfolio/Portfolio.dart';
import 'package:sectiontasks/Profile/user_profile_model.dart';
import 'package:sectiontasks/home.dart';
import 'package:sectiontasks/task1.dart';
import 'package:sectiontasks/task2.dart';
import 'package:sectiontasks/test.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProfileModel(),
      child: const MyApp(),
    ),
  );
}

//
// void main() {
//   runApp(const MyApp());
// }
//
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => UserProfileModel()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'task1':
            (context) => Task1(
              title: 'The Important of Tree',
              body:
                  'Trees play a vital role in maintaining the balance of our environment. They produce the oxygen we breathe, absorb carbon dioxide, and help reduce the effects of climate change. Trees also provide shelter and food for many species of animals and insects, making them essential to biodiversity. Their roots prevent soil erosion, and their canopies offer shade that helps cool the Earth’s surface. Beyond their environmental benefits, trees contribute to the beauty of landscapes, improve mental well-being, and even reduce noise pollution in urban areas. In short, trees are not just a part of nature—they are the foundation of a healthy and sustainable planet.',
              images: [],
            ),
        'task2': (context) => Task2(),
        'home': (context) => Home(),
        'contact': (context) => ContactScreen(),
        'portfolio': (context) => PortfolioScreen(),
        'test': (context) => Test(),
      },
    );
  }
}
