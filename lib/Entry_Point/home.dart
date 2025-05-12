import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('details');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                // Changes button color (use any color you want)
                foregroundColor: Colors.white, // Changes text/icon color
              ),
              child: Text("Details"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('portfolio');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                // Changes button color (use any color you want)
                foregroundColor: Colors.white, // Changes text/icon color
              ),
              child: Text("Portfolio"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('add_item');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                // Changes button color (use any color you want)
                foregroundColor: Colors.white, // Changes text/icon color
              ),
              child: Text("AddItemScreen"),
            ),
          ],
        ),
      ),
    );
  }
}
