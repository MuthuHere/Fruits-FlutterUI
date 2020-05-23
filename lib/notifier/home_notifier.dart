import 'package:flutter/material.dart';
import 'package:fruitapp/base/base_notifier.dart';
import 'package:fruitapp/model/list_item.dart';

class HomeNotifier extends BaseNotifier {
  List<ListItem> _items;

  int _selectedTabPosition = 0;

  HomeNotifier() {
    this.items = listItems;
  }

  List<ListItem> get items => _items;

  set items(List<ListItem> value) {
    _items = value;
    notifyListeners();
  }

  int get selectedTabPosition => _selectedTabPosition;

  set selectedTabPosition(int value) {
    _selectedTabPosition = value;
    notifyListeners();
  }
}
