import 'package:flutter/material.dart';
import 'package:fruitapp/base/base_state.dart';
import 'package:fruitapp/model/intents/product_details_data.dart';
import 'package:fruitapp/notifier/home_notifier.dart';
import 'package:fruitapp/widget/app_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends BaseState<ProductDetailsScreen> {
  IntentProductDetails _productDetails;
  HomeNotifier homeNotifier;

  @override
  Widget build(BuildContext context) {
    _productDetails = ModalRoute.of(context).settings.arguments;
    print(_productDetails.item.name);

    homeNotifier = _productDetails.homeNotifier;

    return ChangeNotifierProvider<HomeNotifier>(
      create: (BuildContext context) => HomeNotifier(),
      child: Consumer<HomeNotifier>(
        builder: (BuildContext context, HomeNotifier value, Widget child) {
          HomeNotifier homeProvider =
              Provider.of<HomeNotifier>(context, listen: true);
          return Scaffold(
            appBar: fruitsAppBar(
              title: _productDetails.item.name,
            ),
            body: Center(
              child: Container(
                child: RaisedButton(
                  onPressed: () {
                    homeNotifier.cartItemCount += 1;
                    goBack();
                  },
                  shape: RoundedRectangleBorder(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
