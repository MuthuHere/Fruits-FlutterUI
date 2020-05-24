import 'package:flutter/material.dart';
import 'package:fruitapp/styles/colors.dart';
import 'package:fruitapp/styles/text_styles.dart';

AppBar fruitsAppBar({@required String title, Type type = Type.THEME}) {
  return AppBar(
    elevation: 0.5,
    iconTheme: IconThemeData(
      color: type == Type.THEME ? colorBlack : colorWhite,
    ),
    backgroundColor: type == Type.THEME ? colorWhite : colorBlack,
    title: Text(
      title,
      style: appNormalText(
        color: type == Type.THEME ? colorBlack : colorWhite,
      ),
    ),
  );
}

enum Type { BLACK, THEME }
