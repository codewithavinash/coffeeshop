import 'package:coffee_shop/utils/page_routes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  // const login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var textColor = Colors.white;
  String name = "";
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      Navigator.pushNamed(context, PageRoutes.homeRoute);
    }
  }

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
                  Text(
                    "Welcome $name",
                    style: TextStyle(
                      fontSize: 22,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    // color: Colors.white,
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            cursorColor: Colors.white,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Username is empty";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              name = value;
                              setState(() {});
                            },
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is empty";
                              } else if (value.length < 6) {
                                return "Password should atleast be 6 character long";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              moveToHome(context);
                            },

                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            // style: TextButton.styleFrom(
                            //   backgroundColor: Colors.brown,
                            //   minimumSize: Size(100, 40),
                            //   side: BorderSide(color: Colors.amber),
                            // ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.brown),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
