import 'package:flutter/material.dart';

class BaseState<T extends StatefulWidget> extends State {
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container();
  }

  goBack({int count = 0}) {
    Navigator.pop(context);
  }

  goBackUntil({@required String routeName}) {
    Navigator.popUntil(context, ModalRoute.withName('$routeName'));
  }

  push({@required String routeName, dynamic data}) {
    Navigator.pushNamed(context, routeName, arguments: data);
  }
}
