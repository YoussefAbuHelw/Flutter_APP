import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login/shared_prefs_service.dart';

class SettingsScreen extends StatelessWidget {
  final List<String> languages = ['English', 'Arabic', 'French'];

  @override
  Widget build(BuildContext context) {
    final _prefsService = context.watch<SharedPrefsService>();

    String selectedLanguage = 'English'; // Static for UI test

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Dark Mode Toggle
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _prefsService.isDarkMode,
            onChanged: (_) => _prefsService.toggleTheme(),
          ),
          SizedBox(height: 20),

          // Language Selection
          Text(
            'Language',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedLanguage,
            items:
                languages
                    .map(
                      (lang) =>
                          DropdownMenuItem(value: lang, child: Text(lang)),
                    )
                    .toList(),
            onChanged: null, // Disabled for testing
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
          SizedBox(height: 32),

          // Logout Button
          ElevatedButton.icon(
            onPressed: () {
              _prefsService.logout();
              Navigator.pushReplacementNamed(context, 'welcome_screen');
            }, // Disabled for testing
            icon: Icon(Icons.logout),
            label: Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
