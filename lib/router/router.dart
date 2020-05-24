import 'package:flutter/material.dart';
import 'package:fruitapp/router/router_constant.dart';
import 'package:fruitapp/ui/detailsscreen/product_details_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DETAILS_PAGE:
        {
          return MaterialPageRoute(
              builder: (_) => ProductDetailsScreen(), settings: settings);
        }
        break;

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
