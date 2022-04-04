import 'package:flutter/material.dart';

import '../provider/item.dart';

class ItemAddNotif extends ChangeNotifier {
  List<Item> itemList = [];
  adddItem(String itemName) async {
    Item item = Item(itemName);
    itemList.add(item);
    notifyListeners();
  }
}
