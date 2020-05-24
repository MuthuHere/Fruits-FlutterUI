import 'package:flutter/material.dart';
import 'package:fruitapp/router/router.dart';
import 'package:fruitapp/ui/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruits',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        secondaryHeaderColor: Color.fromRGBO(246, 125, 156, 1),
        accentColor: Color.fromRGBO(238, 65, 99, 1.0),
        textSelectionColor: Color.fromRGBO(63, 62, 94, 1.0),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: HomePage(),
      ),
    );
  }
}
