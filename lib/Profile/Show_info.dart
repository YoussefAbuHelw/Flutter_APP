import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/Profile/user_profile_model.dart';

class ProfileSummaryScreen extends StatelessWidget {
  const ProfileSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<UserProfileModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${profile.name}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Email: ${profile.email}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Phone Number: ${profile.phoneNumber}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Gender: ${profile.gender}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
