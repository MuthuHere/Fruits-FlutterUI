import 'package:flutter/material.dart';

TextStyle appNormalText({double size = 18.0, Color color = Colors.black87}) =>
    TextStyle(
      fontSize: size,
      decoration: TextDecoration.none,
      color: color,
    );

TextStyle appBoldText(
        {double size = 18.0,
        Color color = Colors.black87,
        FontWeight fontWeight = FontWeight.bold}) =>
    TextStyle(
      fontSize: size,
      color: color,
      decoration: TextDecoration.none,
      fontWeight: fontWeight,
    );
