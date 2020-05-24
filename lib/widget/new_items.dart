import 'package:flutter/material.dart';
import 'package:fruitapp/model/list_item.dart';
import 'package:fruitapp/notifier/home_notifier.dart';
import 'package:fruitapp/styles/colors.dart';
import 'package:fruitapp/styles/text_styles.dart';
import 'package:provider/provider.dart';

class NewItems extends StatefulWidget {
  @override
  _NewItemsState createState() => _NewItemsState();
}

class _NewItemsState extends State<NewItems> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeNotifier>(
      create: (BuildContext context) => HomeNotifier(),
      child: Consumer<HomeNotifier>(
        builder: (BuildContext context, HomeNotifier value, Widget child) =>
            Container(
          height: 140,
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                20,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              RotatedBox(
                quarterTurns: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'New Items',
                    style: appBoldText(
                      color: colorBlack,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      ListItem item = value.items[index];
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorWhite,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image(
                              height: 80,
                              width: 80,
                              image: AssetImage('assets/${item.image}'),
                            ),
                            Text(
                              item.name,
                              style: appNormalText(),
                            ),
                            Text(
                              '${item.price}.00',
                              style: appNormalText(
                                  color: Colors.grey[500], size: 12),
                            ),
                            Spacer(),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
