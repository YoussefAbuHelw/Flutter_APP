import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sectiontasks/Profile/Models/user_model.dart';
import 'package:sectiontasks/Profile/Profile_page/profile_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var profileImage = Provider.of<UserModel>(context).user?.file;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                // MaterialPageRoute(
                //   builder: (context) => CompleteProfileScreen(),
                // ),
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon:
                (profileImage == null)
                    ? Icon(Icons.account_circle_sharp, color: Colors.black)
                    : CircleAvatar(
                      child: ClipOval(
                        child: Image.file(
                          profileImage,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
          ),
        ],
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'task1');
              },
              child: SizedBox(
                child: Column(
                  children: [
                    Image.asset("assets/images/Salah1.jpg"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Salah1"),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_item');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
