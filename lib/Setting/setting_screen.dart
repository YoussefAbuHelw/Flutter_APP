import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final List<String> languages = ['English', 'Arabic', 'French'];

  @override
  Widget build(BuildContext context) {
    String selectedLanguage = 'English'; // Static for UI test

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Dark Mode Toggle
          SwitchListTile(
            title: Text('Dark Mode'),
            value: false,
            onChanged: null, // Disabled for testing
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
            items: languages
                .map((lang) => DropdownMenuItem(
              value: lang,
              child: Text(lang),
            ))
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
            onPressed: null, // Disabled for testing
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
