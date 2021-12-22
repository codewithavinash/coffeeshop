import 'package:coffee_shop/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "coffee shop",
        ),
      ),
      body: Center(
        child: Text(
          "Coffeee Shop",
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
