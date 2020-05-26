import 'package:flutter/material.dart';
import 'package:fruitapp/base/base_notifier.dart';
import 'package:fruitapp/model/list_item.dart';

class HomeNotifier extends BaseNotifier {
  List<ListItem> _items;

  int _selectedTabPosition = 0;
  int _cartItemCount = 0;

  ScrollController _scrollControllerNames = new ScrollController();
  ScrollController _scrollControllerItems = new ScrollController();


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

    _scrollControllerItems.animateTo(
        (value * 210).toDouble(), duration: Duration(microseconds: 300),
        curve: Curves.bounceInOut);
    notifyListeners();
  }

  ScrollController get scrollControllerNames => _scrollControllerNames;

  set scrollControllerNames(ScrollController value) {
    _scrollControllerNames = value;
    notifyListeners();
  }

  ScrollController get scrollControllerItems => _scrollControllerItems;

  set scrollControllerItems(ScrollController value) {
    _scrollControllerItems = value;
    notifyListeners();
  }

  int get cartItemCount => _cartItemCount;

  set cartItemCount(int value) {
    _cartItemCount = value;
    notifyListeners();
  }


}
