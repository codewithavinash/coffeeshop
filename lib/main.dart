import 'package:coffee_shop/provider/login.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  // const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.cyan),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      // initialRoute: "/",
      routes: {
        "/": (ctx) => login(),
        // "/": (ctx) => HomeScreen(),
        // "/login": (ctx) => login(),
      },
    );
  }
}
