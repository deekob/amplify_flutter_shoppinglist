import 'package:flutter/material.dart';
import 'package:smart_shopper/shoppinglistitems_view.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ShoppingListItemsView());
  }
}

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
