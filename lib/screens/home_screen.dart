import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("coffee shop"),
        // backgroundColor: ThemeData.,
      ),
      body: Center(
        child: Text("Coffeee Shop"),
      ),
      drawer: Drawer(),
    );
  }
}
