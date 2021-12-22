import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileImage =
        "https://static.wikia.nocookie.net/marvel_dc/images/4/4b/Batman_Vol_3_86_Textless.jpg";
    return Drawer(
      child: Container(
        color: Colors.brown.shade800,
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.brown.shade800,
                ),
                accountName: Text("Avinash Thakur"),
                accountEmail: Text("avinashthakur.edu@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(profileImage),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.brown.shade100,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.brown.shade100,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.brown.shade100,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.brown.shade100,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.brown.shade100,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.brown.shade100,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
