import 'package:coffee_shop/screens/cart_screen.dart';
import 'package:coffee_shop/screens/login.dart';
import 'package:coffee_shop/utils/page_routes.dart';
import 'package:coffee_shop/widgets/themes.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutes.homeRoute,
      routes: {
        PageRoutes.loginRoute: (ctx) => Login(),
        PageRoutes.homeRoute: (ctx) => HomeScreen(),
        PageRoutes.cartScreen: (ctx) => CartPage(),
      },
    );
  }
}
