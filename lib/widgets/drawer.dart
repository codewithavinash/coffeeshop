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
        // color: Color.fromRGBO(0, 112, 74, 1),
        color: Colors.teal.shade800,
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  // color: Color.fromRGBO(0, 112, 74, 1),
                  color: Colors.teal.shade800,
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
                Icons.how_to_vote,
                color: Colors.white,
              ),
              title: Text(
                "Cold Brew",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.local_drink_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Latte",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.hot_tub_sharp,
                color: Colors.white,
              ),
              title: Text(
                "Hot Coffee",
                style: TextStyle(
                  color: Colors.white,
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
