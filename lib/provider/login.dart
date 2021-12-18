import 'package:coffee_shop/utils/page_routes.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  // const login({Key? key}) : super(key: key);
  var textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(alignment: Alignment.center, children: [
            Image.network(
              "https://images.unsplash.com/photo-1507133750040-4a8f57021571?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/amigos.png",
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    // color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusColor: textColor,
                            hintText: "username",
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "Enter Name",
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "password",
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, PageRoutes.homeRoute);
                          },
                          child: Text("Login"),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.brown,
                              minimumSize: Size(100, 40)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
