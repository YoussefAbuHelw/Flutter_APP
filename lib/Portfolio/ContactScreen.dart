
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Me",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,

        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ContactCard(
              icon: Icons.email,
              iconColor: Colors.deepPurple,
              title: "Email",
              subtitle: "yabwhlw0@gmail.com",
            ),
            SizedBox(height: 15),
            ContactCard(
              icon: Icons.phone,
              iconColor: Colors.green,
              title: "Phone",
              subtitle: "+20 112 147 0841",
            ),
            SizedBox(height: 15),
            ContactCard(
              icon: Icons.person,
              iconColor: Colors.blue,
              title: "Username",
              subtitle: "Youssef Mohamed",
            ),
            ContactCard(
              icon: Icons.add_business_outlined,
              iconColor: Colors.blue,
              title: "Linked In",
              subtitle: "My Linked In Profile",
            ),
            Spacer(),
            // pushes the Back button to the bottom of the screen by taking up all the space above it.
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              label: Text(
                "Back",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 15),
                // adding vertical padding
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const ContactCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //gives the card rounded corners.
      child: ListTile(
        //A pre-built layout with a leading, title, and subtitle.
        leading: Icon(icon, color: iconColor, size: 30),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}