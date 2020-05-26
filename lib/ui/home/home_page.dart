import 'package:flutter/material.dart';
import 'package:fruitapp/notifier/home_notifier.dart';
import 'package:fruitapp/styles/colors.dart';
import 'package:fruitapp/styles/text_styles.dart';
import 'package:fruitapp/widget/categories.dart';
import 'package:fruitapp/widget/new_items.dart';

class HomePage extends StatefulWidget {
  final HomeNotifier homeNotifier;


  HomePage(this.homeNotifier);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10,
            ),
            child: Text(
              'All Fruits',
              style: appBoldText(
                color: colorTextBlack,
              ),
            ),
          ),

          Categories(widget.homeNotifier),

          NewItems(),

        ],
      ),
    );
  }
}
