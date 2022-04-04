import 'package:blog_app/congif/colors.dart';
import 'package:blog_app/screens/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifier/itemaddnotifier.dart';
import 'Additemscreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text("HomeScreen"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                          return LoginPage();
                        },
                      ));
                },
                icon: Icon(
                  Icons.outbox_rounded,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Consumer<ItemAddNotif>(builder: (context, ItemAddNotif, _) {
                return SizedBox(
                  height: 800,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: ItemAddNotif.itemList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          ItemAddNotif.itemList[index].itemName,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.pink[300],
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) {
                return AddItem();
              },
            ),
          );
        },
        label: const Text('Home'),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
