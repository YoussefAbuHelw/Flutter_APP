import 'package:flutter/material.dart';
import 'package:sectiontasks/DashBoard/dashboard.dart';
import 'package:sectiontasks/DashBoard/nav_bar.dart';
import 'package:sectiontasks/Entry_Point/home.dart';
import 'package:sectiontasks/Portfolio/ContactScreen.dart';
import 'package:sectiontasks/Portfolio/Portfolio.dart';
import 'package:sectiontasks/Profile/Models/user_model.dart';
import 'package:sectiontasks/Profile/Models/user_profile_model.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/Tasks/test.dart';
import 'package:sectiontasks/add_item/add_item_screen.dart';
import 'package:sectiontasks/add_item/item_model.dart';
import 'package:sectiontasks/favourite/favourite_model.dart';
import 'package:sectiontasks/items_datails/details_screen.dart';

import '../Light_Dark/theme_model.dart';
import '../Light_Dark/theme_view_model.dart';
import '../Sign_up/signup_screen.dart';
import '../Sign_up/signup_view_model.dart';
import '../Splash/SplashScreen.dart';
import '../login/login_screen.dart';
import '../login/login_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => UserProfileModel()),
        ChangeNotifierProvider(create: (_) => ThemeViewModel(ThemeModel())),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => ItemModel()),
        ChangeNotifierProvider(create: (_) => FavouriteModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();

    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeViewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'details':
            (context) => DetailsScreen(
              title: 'The Important of Tree',
              body:
                  'Trees play a vital role in maintaining the balance of our environment. They produce the oxygen we breathe, absorb carbon dioxide, and help reduce the effects of climate change. Trees also provide shelter and food for many species of animals and insects, making them essential to biodiversity. Their roots prevent soil erosion, and their canopies offer shade that helps cool the Earth’s surface. Beyond their environmental benefits, trees contribute to the beauty of landscapes, improve mental well-being, and even reduce noise pollution in urban areas. In short, trees are not just a part of nature—they are the foundation of a healthy and sustainable planet.',
              images: [],
            ),
        'add_item': (context) => AddItemScreen(),
        'home': (context) => Home(),
        'contact': (context) => ContactScreen(),
        'portfolio': (context) => PortfolioScreen(),
        'test': (context) => Test(),
        'dashboard': (context) => DashboardScreen(),
        'nav_bar': (context) => NavBar(),
        'login': (context) => LoginScreen(),
        'signup': (context) => SignUpScreen(),
        'splash': (context) => SplashScreen(),
      },
    );
  }
}
