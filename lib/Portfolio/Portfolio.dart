import 'package:flutter/material.dart';
import 'package:sectiontasks/Portfolio/ContactScreen.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: PScreen(),
      routes: {'contact': (context) => ContactScreen()},
    );
  }
}

class PScreen extends StatefulWidget {
  const PScreen({super.key});

  @override
  _PScreenState createState() => _PScreenState();
}

class _PScreenState extends State<PScreen> {
  bool isFirstImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),

        backgroundColor: Colors.purple,
        title: Text(
          "My Portfolio",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hey There, I'm Youssef Mohamed",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "I design beautifully simple things. And I love what I do.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  isFirstImage = !isFirstImage;
                });
              },
              child: ClipOval(
                child: Image.asset(
                  isFirstImage
                      ? 'assets/images/Salah1.jpg'
                      : 'assets/images/Salah2.jpg',
                  height: 200,
                  width: 200, // Make it square for perfect circle
                  fit: BoxFit.cover, // Make sure it fills the circle
                ),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'contact');
              },
              child: Text("Contact Me"),
            ),
          ],
        ),
      ),
    );
  }
}
