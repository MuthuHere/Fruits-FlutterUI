import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fruitapp/router/router.dart';
import 'package:fruitapp/ui/home/home_page.dart';
import 'package:provider/provider.dart';

import 'notifier/home_notifier.dart';

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
      home: ChangeNotifierProvider<HomeNotifier>(
        create: (BuildContext context) => HomeNotifier(),
        child: Consumer<HomeNotifier>(
          builder: (BuildContext context, HomeNotifier value, Widget child) {
            HomeNotifier notifier =
                Provider.of<HomeNotifier>(context, listen: true);

            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                actions: <Widget>[
                  _shoppingCartBadge(notifier),
                ],
              ),
              body: HomePage(value),
            );
          },
        ),
      ),
    );
  }

  Widget _shoppingCartBadge(HomeNotifier notifier) {
    return Badge(
      position: BadgePosition.topRight(top: 3, right: 5),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        notifier.cartItemCount.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
    );
  }
}
