import 'package:flutter/material.dart';
import 'package:fruitapp/model/intents/product_details_data.dart';
import 'package:fruitapp/model/list_item.dart';
import 'package:fruitapp/notifier/home_notifier.dart';
import 'package:fruitapp/router/router_constant.dart';
import 'package:fruitapp/styles/colors.dart';
import 'package:fruitapp/styles/text_styles.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  final HomeNotifier homeNotifier;

  Categories(this.homeNotifier);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeNotifier>(
      create: (BuildContext context) => HomeNotifier(),
      child: Consumer<HomeNotifier>(
        builder: (BuildContext context, HomeNotifier value, Widget child) {
          return Column(
            children: <Widget>[
              _listCategory(value),
              _fruitsShow(value),
            ],
          );
        },
      ),
    );
  }

  Widget _listCategory(HomeNotifier value) {
    return Container(
      height: 45.0,
      child: ListView.builder(
          controller: value.scrollControllerNames,
          scrollDirection: Axis.horizontal,
          itemCount: value.items.length,
          itemBuilder: (BuildContext context, int index) {
            ListItem item = value.items[index];
            var selectedColor =
                value.selectedTabPosition == index ? colorBlack : colorGray;
            return GestureDetector(
              onTap: () {
                value.selectedTabPosition = index;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selectedColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: Text(
                    item.name,
                    style: appBoldText(
                      color: selectedColor,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _fruitsShow(HomeNotifier value) {
    return Container(
      // transform: Matrix4.rotationZ(0.1),
      height: MediaQuery.of(context).size.height * .5,
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: ListView.builder(
          controller: value.scrollControllerItems,
          scrollDirection: Axis.horizontal,
          itemCount: value.items.length,
          itemBuilder: (BuildContext context, int index) {
            ListItem item = value.items[index];

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DETAILS_PAGE,
                  arguments: IntentProductDetails(
                    item,
                    widget.homeNotifier
                  ),
                );
              },
              child: Container(
                width: 210,
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Color(
                    int.parse(item.color),
                  ),
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 9,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            item.name,
                            style: appNormalText(color: colorWhite),
                          ),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: item.price + '.00',
                                  style: appBoldText(
                                    color: colorWhite,
                                  ),
                                ),
                                TextSpan(
                                  text: '(${item.kg})',
                                  style: appBoldText(
                                    color: colorWhite,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Image(
                        height: 150,
                        width: 150,
                        image: AssetImage(
                          'assets/${item.image}',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          item.description,
                          style: appNormalText(color: colorWhite, size: 13),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        color: colorBlack.withOpacity(
                          0.1,
                        ),
                        onPressed: () {
                          widget.homeNotifier.cartItemCount += 1;
                        },
                        child: Text(
                          'Add to cart',
                          style: appNormalText(color: colorWhite, size: 13),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
