import 'package:flutter/material.dart';
import 'package:fruitapp/model/list_item.dart';
import 'package:fruitapp/notifier/home_notifier.dart';
import 'package:fruitapp/styles/colors.dart';
import 'package:fruitapp/styles/text_styles.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
      height: 360.0,
      margin: EdgeInsets.only(top: 20),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value.items.length,
          itemBuilder: (BuildContext context, int index) {
            ListItem item = value.items[index];

            return Container(
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
                        text: TextSpan(children: <TextSpan>[
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
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
