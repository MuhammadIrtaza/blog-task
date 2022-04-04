import 'package:blog_app/congif/colors.dart';

import 'package:blog_app/screens/loginpage.dart';
import 'package:flutter/material.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: primaryColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 350,
                child: Image.asset("assets/pencil.png"),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  height: 300,
                  width: 350,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Welcome to BLOG App!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Text(
                          "A easy powerful tool to ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Center(
                        child: Text(
                          "share your Stories",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        },
                        child: Container(
                            alignment: Alignment.center,
                            color: Color.fromARGB(255, 62, 203, 247),
                            height: 50,
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Get Started ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Icon(
                                  Icons.forward,
                                  color: Colors.white,
                                ),
                              ],
                            )),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
