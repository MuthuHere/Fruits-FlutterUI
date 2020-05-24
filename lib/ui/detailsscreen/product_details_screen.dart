import 'package:flutter/material.dart';
import 'package:fruitapp/model/intents/product_details_data.dart';
import 'package:fruitapp/widget/app_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  IntentProductDetails _productDetails;

  @override
  Widget build(BuildContext context) {
    _productDetails = ModalRoute.of(context).settings.arguments;
    print(_productDetails.item.name);
    return Scaffold(
      appBar: fruitsAppBar(
        title:_productDetails.item.name,
      ),
    );
  }
}
