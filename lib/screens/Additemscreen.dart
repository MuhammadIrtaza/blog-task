import 'package:blog_app/congif/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifier/itemaddnotifier.dart';

class AddItem extends StatelessWidget {
  final TextEditingController _itemNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text("12 January 2022"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: TextField(
          controller: _itemNameController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: "Enter Text",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()
            // Add your onPressed code here!
            async {
          if (_itemNameController.text.isEmpty) {
            return;
          }
          await Provider.of<ItemAddNotif>(context, listen: false)
              .adddItem(_itemNameController.text);
          Navigator.pop(context);
        },
        label: const Text('Done'),
        icon: const Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
