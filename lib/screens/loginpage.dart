import 'package:blog_app/congif/colors.dart';
import 'package:blog_app/screens/homepage.dart';
import 'package:blog_app/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 60, left: 20, right: 20),
                height: 250,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      child: Image.asset(
                        "assets/login.png",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Enter you email",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "and password",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 300,
                width: 350,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Email",
                          style: TextStyle(color: Colors.white),
                        ),
                        contentPadding: EdgeInsets.all(15),
                        hintText: "Enter your Email",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        label: Text(
                          "Passowrd",
                          style: TextStyle(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(15),
                        hintText: "Enter your Password",
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Homepage()));
                        final String email = emailController.text.trim();
                        final String password = emailController.text.trim();
                        if (email.isEmpty) {
                          print("email empty");
                        } else {
                          if (password.isEmpty) {
                            print("password empty");
                          } else {
                            context
                                .read<AuthService>()
                                .login(
                                  email,
                                  password,
                                )
                                .then((value) async {
                              User? user = FirebaseAuth.instance.currentUser;
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(user!.uid)
                                  .set({
                                'uid': user.uid,
                                'email': email,
                                'password': password
                              });
                            });
                          }
                        }
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
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Homepage(),
                          ),
                        );
                        final String email = emailController.text.trim();
                        final String password = emailController.text.trim();
                        if (email.isEmpty) {
                          print("email empty");
                        } else {
                          if (password.isEmpty) {
                            print("password empty");
                          } else {
                            context.read<AuthService>().signUp(
                                  email,
                                  password,
                                );
                          }
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          color: Colors.red,
                          height: 50,
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
