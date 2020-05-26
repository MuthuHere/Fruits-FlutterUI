import 'package:fruitapp/model/list_item.dart';
import 'package:fruitapp/notifier/home_notifier.dart';

class IntentProductDetails {
  final ListItem item;
  final HomeNotifier homeNotifier;

  IntentProductDetails(this.item,this.homeNotifier);

}