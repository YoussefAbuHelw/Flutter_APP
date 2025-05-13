import 'package:flutter/material.dart';
import 'package:sectiontasks/DashBoard/dashboard.dart';
import 'package:sectiontasks/Profile/Profile_page/profile_page.dart';
import 'package:sectiontasks/Setting/setting_screen.dart';
import 'package:sectiontasks/favourite/favourite_screen.dart';
import 'package:sectiontasks/quote/quote_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          [
            DashboardScreen(),
            ProfilePage(),
            SettingsScreen(),
            QuoteScreen(),
            FavouriteScreen(),
          ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
          NavigationDestination(
            icon: Icon(Icons.format_quote),
            label: "Quotes",
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
