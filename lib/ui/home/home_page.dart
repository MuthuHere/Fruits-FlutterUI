import 'package:flutter/material.dart';
import 'package:fruitapp/styles/colors.dart';
import 'package:fruitapp/styles/text_styles.dart';
import 'package:fruitapp/widget/categories.dart';

class HomePage extends StatefulWidget {
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
              horizontal: 15.0,
              vertical: 10,
            ),
            child: Text(
              'All Fruits',
              style: appBoldText(
                color: colorTextBlack,
              ),
            ),
          ),

          Categories(),

        ],
      ),
    );
  }
}
